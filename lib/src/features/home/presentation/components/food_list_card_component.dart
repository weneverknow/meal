import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart' as fm;
import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';
import 'package:meal/src/features/add_food_favourite/presentation/bloc/food_favourite_bloc.dart';
import 'package:meal/src/features/food_detail/presentation/page/food_detail_screen.dart';
import '../../../../config/my_db.dart';
import '../../../../config/style.dart';
import '../../../add_food_favourite/data/datasource/food_favourite_data_source.dart';
import '../../../add_food_favourite/data/repositories/food_favourite_repository_impl.dart';
import '../../domain/entities/food.dart';
import '../bloc/food_bloc.dart';
import '../bloc/food_category_selected_bloc.dart';

class FoodListCardComponent extends StatelessWidget {
  //FoodListCardComponent({Key? key}) : super(key: key);

  final foodRepository =
      FoodFavouriteRepositoryImpl(FoodFavouriteDataSourceImpl(MyDb.mydb!));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodCategorySelectedBloc, FoodCategorySelectedState>(
      builder: (context, categoryState) {
        return BlocBuilder<FoodBloc, FoodState>(
          //BloC for list food
          builder: (context, state) {
            if (state is FoodLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FoodLoaded) {
              var items = state.food;
              items = categoryState is FoodCategorySelectedInitial
                  ? items
                  : (categoryState as FoodCategorySelected).foodCategory.id ==
                          "000"
                      ? items
                      : items
                          .where((element) =>
                              element.category ==
                              (categoryState).foodCategory.name)
                          .toList();
              return GridView.builder(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultpadding),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 30,
                      crossAxisSpacing: 15,
                      maxCrossAxisExtent: MediaQuery.of(context).size.width -
                          (defaultpadding * 4),
                      childAspectRatio: 0.8),
                  itemCount: items.length,
                  itemBuilder: (contex, index) {
                    return buildFoodCard(
                      context,
                      items[index],
                    );
                  });
            }
            if (state is FoodFailure) {
              return Center(
                child: Text('No data found'),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }

  Widget buildFoodCard(BuildContext context, Food food,
      {Function()? addFavourite, bool isFav = false}) {
    return GestureDetector(
      onTap: () {
        fm.Modular.to.navigate('/food-detail', arguments: food);
        // Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => FoodDetailScreen(food: food)));
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 2), blurRadius: 4)
            ],
            image: DecorationImage(
                image: NetworkImage(food.image), fit: BoxFit.cover)),
        padding: const EdgeInsets.symmetric(vertical: defaultpadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultpadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      food.category,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  BlocBuilder<FoodFavouriteBloc, FoodFavouriteState>(
                      builder: (context, state) {
                    List<FoodFavourite> fav =
                        (state is FoodFavouriteLoaded) ? state.favourites : [];

                    return GestureDetector(
                      onTap: () async {
                        FoodFavourite? isExist = await foodRepository
                            .getFoodById(int.tryParse(food.id) ?? 0);
                        print("isExist $isExist");
                        if (isExist != null) {
                          await foodRepository
                              .delete(int.tryParse(food.id) ?? 0);
                          context.read<FoodFavouriteBloc>().add(
                              DeleteFavouriteFood(int.tryParse(food.id) ?? 0));
                        } else {
                          await foodRepository.insert(food);
                          context.read<FoodFavouriteBloc>().add(
                              AddFavouriteFood(FoodFavourite(
                                  id: int.tryParse(food.id) ?? 0,
                                  foodId: int.tryParse(food.id) ?? 0,
                                  category: food.category,
                                  name: food.name,
                                  image: food.image,
                                  tags: food.tag)));
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: Colors.white.withOpacity(0.5)),
                        child: fav.any((element) =>
                                element.foodId == (int.tryParse(food.id) ?? 0))
                            ? Icon(
                                Icons.favorite_rounded,
                                size: 28,
                                color: Colors.pink,
                              )
                            : Icon(
                                Icons.favorite_border_rounded,
                                size: 28,
                              ),
                      ),
                    );
                  })
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: Colors.white.withOpacity(0.6),
              padding: const EdgeInsets.all(defaultpadding / 2),
              child: Text(
                food.name,
                style: TextStyle(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.clip,
              ),
            )
          ],
        ),
      ),
    );
  }
}
