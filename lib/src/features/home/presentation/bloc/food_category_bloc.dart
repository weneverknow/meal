import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/features/home/domain/usecases/food_category_get_all.dart';
import 'package:meal/src/features/home/presentation/bloc/food_bloc.dart';

part 'food_category_event.dart';
part 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  final FoodCategoryGetAll foodCategoryGetAll;

  FoodCategoryBloc({required this.foodCategoryGetAll})
      : super(FoodCategoryInitial()) {
    on<FoodCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadFoodCategory>(loadCategories);
  }

  void loadCategories(
      FoodCategoryEvent event, Emitter<FoodCategoryState> emit) async {
    final result = await foodCategoryGetAll.getFoodCategories();
    emit(FoodCategoryLoaded(result));
  }
}
