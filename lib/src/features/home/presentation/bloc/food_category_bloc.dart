import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/features/home/domain/usecases/food_category_get_all.dart';

part 'food_category_event.dart';
part 'food_category_state.dart';

class FoodCategoryBloc extends Bloc<FoodCategoryEvent, FoodCategoryState> {
  final FoodCategoryGetAll foodCategoryGetAll;

  FoodCategoryBloc({required this.foodCategoryGetAll})
      : super(FoodCategoryInitial()) {
    on<FoodCategoryEvent>((event, emit) {});
    on<LoadFoodCategory>(loadCategories);
  }

  void loadCategories(
      FoodCategoryEvent event, Emitter<FoodCategoryState> emit) async {
    final result = await foodCategoryGetAll.call(NoParam());
    result.fold(
        (l) => emit(FoodCategoryFailure()), (r) => emit(FoodCategoryLoaded(r)));
  }
}
