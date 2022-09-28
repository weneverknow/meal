//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';

import '../../../../core/config/style.dart';
import '../bloc/food_category_bloc.dart';
import '../bloc/food_category_selected_bloc.dart';

class CategoryCardComponent extends StatelessWidget {
  const CategoryCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: defaultpadding),
      height: 35,
      child: BlocBuilder<FoodCategoryBloc, FoodCategoryState>(
        builder: (context, state) {
          if (state is FoodCategoryLoaded) {
            final items = state.categories;
            return BlocBuilder<FoodCategorySelectedBloc,
                FoodCategorySelectedState>(
              builder: (context, state) {
                var selectedCategory = state is FoodCategorySelectedInitial
                    ? items[0]
                    : (state as FoodCategorySelected).foodCategory;
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) => buildCard(
                            index, items[index],
                            selectedFoodCategory: selectedCategory, onTap: () {
                          context
                              .read<FoodCategorySelectedBloc>()
                              .add(SelectFoodCategory(items[index]));
                        }));
              },
            );
          }
          if (state is FoodCategoryFailure) {
            return Center(
              child: Text('Food Categories not loaded!'),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget buildCard(int index, FoodCategory category,
      {required FoodCategory selectedFoodCategory, Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
            left: defaultpadding, right: index == 4 ? defaultpadding : 0),
        padding: const EdgeInsets.symmetric(
            horizontal: defaultpadding / 2, vertical: defaultpadding / 2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: category == selectedFoodCategory
              ? primarycolor.withOpacity(0.7)
              : Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Image.network(
              category.image ?? '',
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: defaultpadding / 2,
            ),
            Text(
              category.name,
              style: TextStyle(
                  color: category == selectedFoodCategory
                      ? Colors.white
                      : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
