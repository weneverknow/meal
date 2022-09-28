import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';
import 'package:meal/src/features/home/domain/usecases/food_get_all.dart';
import 'package:meta/meta.dart';

part 'food_event.dart';
part 'food_state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  final FoodGetAll foodGetAll;

  FoodBloc({required this.foodGetAll}) : super(FoodInitial()) {
    on<FoodEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoadFood>(loadFood);
  }

  void loadFood(FoodEvent event, Emitter<FoodState> emit) async {
    print("[FoodBloc] loadFood executed");
    emit(FoodLoading());
    final result = await foodGetAll.call(NoParam());
    result.fold((l) => emit(FoodFailure()), (r) => emit(FoodLoaded(r)));
  }
}
