import 'package:meal/src/features/home/domain/entities/food_category.dart';
import 'package:meal/src/http/http_service.dart';

import '../../../../http/response_api.dart';

abstract class FoodCategoryRemoteDataSource {
  Future<List<FoodCategory>> getFoodCategories();
}

class FoodCategoryRemoteDataSourceImpl implements FoodCategoryRemoteDataSource {
  final HttpService httpService;
  const FoodCategoryRemoteDataSourceImpl(this.httpService);

  @override
  Future<List<FoodCategory>> getFoodCategories() async {
    ResponseApi response = await httpService.get('categories.php');
    List<FoodCategory>? result;
    result = (response.data['categories'] as List).isEmpty
        ? []
        : (response.data['categories'] as List)
            .map((e) => FoodCategory.fromJson(e))
            .toList();
    result.insert(
        0,
        FoodCategory(
            id: '000',
            name: 'All Meal',
            image:
                'https://cdn0.iconfinder.com/data/icons/category-of-words-and-phrases/128/All-512.png'));
    return Future.value(result);
  }
}
