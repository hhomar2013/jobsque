import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio  ;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://project2.amit-learning.com/api',
        receiveDataWhenStatusError: true,

      )
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String , dynamic> query,
  })async{
    return await dio!.get(
      url,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }


}