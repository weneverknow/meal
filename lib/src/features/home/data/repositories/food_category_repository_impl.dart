import 'package:meal/src/features/home/data/datasource/food_category_remote_data_source.dart';
import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/features/home/domain/repositories/food_category_repository.dart';

class FoodCategoryRepositoryImpl implements FoodCategoryRepository {
  final FoodCategoryRemoteDataSource remoteDataSource;
  const FoodCategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<FoodCategory>> getFoodCategories() async {
    return await remoteDataSource.getFoodCategories();
  }
}
