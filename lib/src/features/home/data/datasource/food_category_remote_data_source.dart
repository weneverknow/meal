import 'package:meal/src/features/home/data/model/food_category_model.dart';
import 'package:meal/src/core/http/http_service.dart';

import '../../../../core/exception/exceptions.dart';
import '../../../../core/http/response_api.dart';

abstract class FoodCategoryRemoteDataSource {
  Future<List<FoodCategoryModel>> getFoodCategories();
}

class FoodCategoryRemoteDataSourceImpl implements FoodCategoryRemoteDataSource {
  final HttpService httpService;
  const FoodCategoryRemoteDataSourceImpl(this.httpService);

  @override
  Future<List<FoodCategoryModel>> getFoodCategories() async {
    try {
      ResponseApi response = await httpService.get('categories.php');
      List<FoodCategoryModel>? result;
      result = (response.data['categories'] as List).isEmpty
          ? []
          : (response.data['categories'] as List)
              .map((e) => FoodCategoryModel.fromJson(e))
              .toList();
      result.insert(
          0,
          FoodCategoryModel(
              id: '000',
              name: 'All Meal',
              image:
                  'https://cdn0.iconfinder.com/data/icons/category-of-words-and-phrases/128/All-512.png'));
      return Future.value(result);
    } catch (e) {
      throw ServerException(
          'Something went wrong while fetching data from server');
    }
  }
}
