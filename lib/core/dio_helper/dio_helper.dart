import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper {
  static Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl:
          'http://algorithm.demo.carmartapp.com/Hiring-Medical/public/api/',
      receiveDataWhenStatusError: true,
      followRedirects: false,
      validateStatus: (status) {
        return status < 500;
      },
      headers: {
        'Content-Type': 'application/json',
      },
    ));
  }

  static Future<Response> getData({
    @required String url,
    @required Map<String, dynamic> query,
    String token,
  }) async {
    dio.options.headers={};
    return await dio.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    @required String url,
    @required Map<String, dynamic> data,
    Map<String, dynamic> query,
  }) async {
    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }
}
