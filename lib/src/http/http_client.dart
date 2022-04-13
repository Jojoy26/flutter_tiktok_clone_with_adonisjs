// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:dio/dio.dart';

mixin HttpClient {

  Dio dio = Dio();
  String baseUrl = 'http://192.168.0.106:3333';

  Future<Response<dynamic>> callGetApi(String url, var body, Map<String, dynamic>? header) async {
    var response = await dio.get(baseUrl+url, queryParameters: body, options: Options(headers: header));
    return response;
  }

  Future<Response<dynamic>> callPostApi(String url, var body, Map<String, dynamic>? header) async {
    var response = await dio.post(baseUrl+url, data: body, options: Options(headers: header));
    return response;
  }

}