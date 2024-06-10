import 'package:dio/dio.dart';
import 'package:jobsque/shared/components/constant.dart';

class DioHelper {
  static Dio? dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://project2.amit-learning.com/api',
        receiveDataWhenStatusError: true,

      )
    );
  }

  static Future<Response> getData1({
    required String url,
    required String token,
    Options? options
  })async{
    dio?.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.get(
        url,
        // options:options
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String , dynamic> query,
    Options? options
  })async{
    return await dio!.get(
      url,
      queryParameters: query,
      options:options
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options
  }) async {

    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }


  static Future<Response> postData1({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    String? token,
  }) async {
    dio?.options.headers['Authorization'] = 'Bearer $token';
    return await dio!.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }



}