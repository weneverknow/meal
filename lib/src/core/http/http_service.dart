import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meal/src/core/http/response_api.dart';
import '../../env.dart';

class HttpService {
  Dio dio = Dio();

  Future<ResponseApi> get(String url) async {
    //await Future.delayed(Duration(seconds: 5));
    var response = await dio.get('${Env.apiKey}/$url');
    print("[HttpService] ${jsonEncode(response.data)}");
    var data = jsonDecode(jsonEncode(response.data));

    return ResponseApi(
        responseCode: response.statusCode ?? 200,
        message: response.statusCode != 200 ? response.statusMessage : null,
        data: data);
  }
}
