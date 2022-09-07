import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';

part 'food_category_selected_event.dart';
part 'food_category_selected_state.dart';

class FoodCategorySelectedBloc
    extends Bloc<FoodCategorySelectedEvent, FoodCategorySelectedState> {
  FoodCategorySelectedBloc() : super(FoodCategorySelectedInitial()) {
    on<FoodCategorySelectedEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SelectFoodCategory>((event, emit) {
      emit(FoodCategorySelected(event.foodCategory));
    });
  }
}
