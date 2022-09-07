import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' as fm;
import 'package:meal/src/config/my_db.dart';
import 'package:meal/src/config/style.dart';
import 'package:meal/src/features/add_food_favourite/presentation/bloc/food_favourite_bloc.dart';
import 'package:meal/src/features/home/presentation/components/category_card_component.dart';
import 'package:meal/src/features/home/presentation/components/favourite_card_component.dart';
import 'package:meal/src/features/home/presentation/components/food_list_card_component.dart';
import 'package:meal/src/widget/my_text.dart';

import '../../../add_food_favourite/data/datasource/food_favourite_data_source.dart';
import '../../../add_food_favourite/data/repositories/food_favourite_repository_impl.dart';
import '../../../welcome/presentation/bloc/member_bloc.dart';
import '../../domain/entities/food.dart';
import '../bloc/food_bloc.dart';
import '../bloc/food_category_selected_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TitleText? _titleText;
  SubtitleText? _subtitleText;
  //late MyDatabase database;
  //List<FoodFavourite>? items;
  @override
  void initState() {
    //database = MyDatabase();
    //loadFoodFavourite();
    super.initState();
  }

  // loadFoodFavourite() async {
  //   final ff = await database.select(database.foodFavourites).get();
  //   items = ff;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultpadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (_subtitleText = SubtitleText()
                      ..text = 'hi'
                      ..color = Colors.grey.shade500)
                    .child,
                BlocBuilder<MemberBloc, MemberState>(
                  builder: (context, state) {
                    return Text(
                        '${(state as MemberLoaded).member.name.toUpperCase()}');
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: defaultpadding,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultpadding, vertical: defaultpadding / 2),
              child:
                  (_titleText = TitleText()..text = 'Favourite Meal').child()),
          FavouriteCardComponent(),
          const SizedBox(
            height: defaultpadding / 2,
          ),
          CategoryCardComponent(),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultpadding, vertical: defaultpadding / 2),
            child: BlocBuilder<FoodCategorySelectedBloc,
                FoodCategorySelectedState>(
              builder: (context, state) {
                return (_titleText = TitleText()
                      ..text = state is FoodCategorySelectedInitial
                          ? 'All Meal'
                          : (state as FoodCategorySelected).foodCategory.name)
                    .child();
              },
            ),
          ),
          //begin all food card here
          Flexible(child: FoodListCardComponent()),
          //end all food card here
          const SizedBox(
            height: defaultpadding / 2,
          ),
        ],
      )),
    );
  }
}
