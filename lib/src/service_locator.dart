import 'package:get_it/get_it.dart';
import 'package:meal/src/core/http/http_service.dart';
import 'package:meal/src/features/favourite_food/data/datasource/food_favourite_data_source.dart';
import 'package:meal/src/features/favourite_food/data/repositories/food_favourite_repository_impl.dart';
import 'package:meal/src/features/favourite_food/domain/usecase/fetch_favourite_food.dart';
import 'package:meal/src/features/favourite_food/presentation/bloc/food_favourite_bloc.dart';
import 'package:meal/src/features/home/data/datasource/food_category_remote_data_source.dart';
import 'package:meal/src/features/home/data/datasource/food_remote_data_source.dart';
import 'package:meal/src/features/home/data/repositories/food_category_repository_impl.dart';
import 'package:meal/src/features/home/data/repositories/food_repository_impl.dart';
import 'package:meal/src/features/home/domain/usecases/food_category_get_all.dart';
import 'package:meal/src/features/home/presentation/bloc/food_bloc.dart';
import 'package:meal/src/features/registration/data/datasource/member_data_source.dart';
import 'package:meal/src/features/registration/data/repositories/member_repository_impl.dart';
import 'package:meal/src/features/registration/domain/repositories/welcome_repository.dart';
import 'package:meal/src/features/registration/domain/usecase/select_member.dart';
import 'package:meal/src/features/registration/presentation/bloc/member_bloc.dart';
import 'package:meal/src/features/registration/presentation/bloc/welcome_validation_cubit.dart';

import 'features/favourite_food/domain/repository/favourite_food_repository.dart';
import 'features/home/domain/repositories/food_category_repository.dart';
import 'features/home/domain/repositories/food_repository.dart';
import 'features/home/domain/usecases/food_get_all.dart';
import 'features/home/presentation/bloc/food_category_bloc.dart';
import 'features/home/presentation/bloc/food_category_selected_bloc.dart';
import 'features/registration/domain/usecase/insert_member.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  /**
   * http service
   */
  sl.registerSingleton<HttpService>(HttpService());
  /**
   * MyDatabase
   */
  //sl.registerFactory<MyDatabase>(() => MyDatabase());
  /**
   * datasource
   */
  sl.registerSingleton<FoodCategoryRemoteDataSource>(
      FoodCategoryRemoteDataSourceImpl(sl()));
  sl.registerSingleton<FoodRemoteDataSource>(FoodRemoteDataSourceImpl(sl()));

  sl.registerSingleton<FoodFavouriteDataSource>(FoodFavouriteDataSourceImpl());

  sl.registerSingleton<MemberDataSource>(MemberDataSourceImpl());

  /**  
   * repositories
  */
  sl.registerSingleton<FoodCategoryRepository>(
      FoodCategoryRepositoryImpl(sl()));
  sl.registerSingleton<FoodRepository>(FoodRepositoryImpl(sl()));

  sl.registerSingleton<WelcomeRepository>(MemberRepositoryImpl(sl()));

  sl.registerSingleton<FavouriteFoodRepository>(
      FoodFavouriteRepositoryImpl(sl()));

  /**
    * usecases
    */
  sl.registerSingleton(SelectMember(sl()));
  sl.registerSingleton(FoodCategoryGetAll(sl()));
  sl.registerSingleton(FoodGetAll(sl()));
  sl.registerSingleton(FetchFavouriteFood(sl()));

  sl.registerSingleton(InsertMember(sl()));

  /**
   * Cubit
   */
  sl.registerSingleton<WelcomeValidationCubit>(WelcomeValidationCubit());

  /**
   * BLoC
   */
  sl.registerSingleton<MemberBloc>(MemberBloc(
      selectMember: sl<SelectMember>(), insertMember: sl<InsertMember>()));
  sl.registerSingleton<FoodBloc>(FoodBloc(foodGetAll: sl()));
  sl.registerSingleton<FoodCategoryBloc>(
      FoodCategoryBloc(foodCategoryGetAll: sl()));
  sl.registerSingleton<FoodCategorySelectedBloc>(FoodCategorySelectedBloc());
  sl.registerSingleton<FoodFavouriteBloc>(FoodFavouriteBloc());
}
