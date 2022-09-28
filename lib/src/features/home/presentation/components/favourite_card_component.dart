import 'package:flutter/material.dart';
import 'package:meal/src/core/config/style.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';
import 'package:meal/src/features/favourite_food/presentation/bloc/food_favourite_bloc.dart';
import 'package:meal/src/core/widget/my_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favourite_food/domain/entity/food_favourite.dart';

class FavouriteCardComponent extends StatelessWidget {
  const FavouriteCardComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FoodFavouriteBloc, FoodFavouriteState>(
        builder: (context, state) {
      //return buildCard();
      //print("rebuild");
      if (state is FoodFavouriteLoaded) {
        var items = state.favourites;
        if (items.isEmpty) {
          return Center(
            child: Text(
              'No Favourite meal found.',
              style: TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w300),
            ),
          );
        }
        return Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return buildCard(index, items[index], context);
                }));
      }
      return const SizedBox.shrink();
    });
  }

  Container buildCard(int index, FoodFavourite food, BuildContext context) {
    return Container(
      height: 130,
      width: 130,
      margin: EdgeInsets.only(
          left: index == 0 ? defaultpadding : 0,
          right: defaultpadding,
          bottom: defaultpadding / 4),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black38,
            offset: Offset(0, 1),
            spreadRadius: -2,
            blurRadius: 4)
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            child: Image.network(
              food.image!,
              height: 80,
              width: 130,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: defaultpadding / 4,
          ),
          Flexible(
            fit: FlexFit.tight,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: defaultpadding / 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          child: Text(
                            food.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                          )),
                      const SizedBox(
                        width: 3,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.favorite_rounded,
                          color: Colors.pink.shade300,
                        ),
                      )
                    ],
                  ),
                  (SubtitleText()..text = food.tags ?? '').child
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
