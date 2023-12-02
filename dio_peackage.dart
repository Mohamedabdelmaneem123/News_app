import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:figma/news%20app/layout/constant/constant.dart';
import 'package:flutter/cupertino.dart';

class Diohelper{
  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true
      ),
    );
    }
   static Future<Response> getdate({
      required String url,
      required Map<String, dynamic> quary, required String path,
})async
    {

   return await dio.get( url,queryParameters: quary,);

}
  }

