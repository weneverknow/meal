import 'package:meal/src/features/home/data/model/food_model.dart';
import 'package:meal/src/http/http_service.dart';
import 'package:meal/src/http/response_api.dart';

abstract class FoodRemoteDataSource {
  Future<List<FoodModel>>? getAll();
}

class FoodRemoteDataSourceImpl implements FoodRemoteDataSource {
  final HttpService httpService;
  FoodRemoteDataSourceImpl(this.httpService);

  @override
  Future<List<FoodModel>>? getAll() async {
    ResponseApi response = await httpService.get('search.php?s=');
    List<FoodModel>? result;
    result = (response.data['meals'] as List).isEmpty
        ? null
        : (response.data['meals'] as List)
            .map((e) => FoodModel.fromJson(e))
            .toList();
    return Future.value(result);
  }
}
