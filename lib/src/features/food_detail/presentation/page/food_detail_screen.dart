import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:meal/src/core/config/style.dart';
import 'package:meal/src/core/widget/my_text.dart';

import '../../../favourite_food/data/model/food_favourite.dart';
import '../../../favourite_food/domain/entity/food_favourite.dart';
import '../../../favourite_food/presentation/bloc/food_favourite_bloc.dart';
import '../../../home/domain/entities/food.dart';

class FoodDetailScreen extends StatefulWidget {
  const FoodDetailScreen({required this.food, Key? key}) : super(key: key);
  final Food food;

  @override
  State<FoodDetailScreen> createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  TitleText? _titleText;
  SubtitleText? _subtitleText;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Modular.to.navigate('/');
        return Future.value(false);
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultpadding, vertical: defaultpadding * 2.5),
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.food.image), fit: BoxFit.cover),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildIconButton(
                      Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ), onTap: () {
                    Modular.to.navigate('/');
                  }),
                  BlocBuilder<FoodFavouriteBloc, FoodFavouriteState>(
                    builder: (context, state) {
                      List<FoodFavourite> fav = (state is FoodFavouriteLoaded)
                          ? state.favourites
                          : [];
                      return buildIconButton(
                          fav.any((element) =>
                                  element.foodId ==
                                  (int.tryParse(widget.food.id) ?? 0))
                              ? Icon(
                                  Icons.favorite_rounded,
                                  color: Colors.pink,
                                )
                              : Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                ), onTap: () async {
                        var fav = FoodFavourite(
                            id: int.tryParse(widget.food.id) ?? 0,
                            foodId: int.tryParse(widget.food.id) ?? 0,
                            category: widget.food.category,
                            name: widget.food.name,
                            image: widget.food.image,
                            tags: widget.food.tag);
                        context
                            .read<FoodFavouriteBloc>()
                            .add(ManageFavouriteFood(fav));
                      });
                    },
                  )
                ],
              ),
            ),
            Flexible(
                child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultpadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          (_titleText = TitleText()..text = widget.food.name)
                              .child(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: defaultpadding / 2,
                                vertical: defaultpadding / 4),
                            decoration: BoxDecoration(
                                color: primarycolor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            child: (_subtitleText = SubtitleText()
                                  ..text = widget.food.category
                                  ..color = Colors.white)
                                .child,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: defaultpadding / 2,
                      ),
                      Text(widget.food.tag ?? 'Others'),
                      const SizedBox(
                        height: defaultpadding * 1.5,
                      ),
                      (_titleText = TitleText()..text = 'Instructions').child(),
                      Container(
                        margin: const EdgeInsets.only(top: defaultpadding / 4),
                        padding: const EdgeInsets.all(defaultpadding / 2),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(10)),
                        child: (_subtitleText = SubtitleText()
                              ..textAlign = TextAlign.justify
                              ..text = widget.food.desc ?? '')
                            .child,
                      ),
                      const SizedBox(
                        height: defaultpadding * 1.5,
                      ),
                      (_titleText = TitleText()..text = 'Ingredients').child(),
                      Column(
                          children: List.generate(
                              widget.food.makeIngredients().length,
                              (index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: defaultpadding / 4),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(widget.food
                                            .makeIngredients()[index]),
                                        (_subtitleText = SubtitleText()
                                              ..text = widget.food
                                                  .makeMeasure()[index])
                                            .child
                                      ],
                                    ),
                                  )))
                    ],
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget buildIconButton(Widget icon, {Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8)),
          child: icon),
    );
  }
}
