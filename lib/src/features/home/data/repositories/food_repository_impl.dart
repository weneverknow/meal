import 'package:meal/src/features/home/data/datasource/food_remote_data_source.dart';
import 'package:meal/src/features/home/domain/entities/food.dart';
import 'package:meal/src/features/home/domain/repositories/food_repository.dart';

class FoodRepositoryImpl implements FoodRepository {
  final FoodRemoteDataSource remoteDataSource;
  const FoodRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Food>> getAll() async {
    return await remoteDataSource.getAll() ?? [];
  }
}
