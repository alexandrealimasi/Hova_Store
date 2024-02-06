import 'dart:io';

import 'package:dio/dio.dart';

class DioService {
  static String baseUrl = "https://65c0dd62dc74300bce8ce1b9.mockapi.io/api/v1/";
  Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
  ));

  Future<Response> fetchDatas(String endPoint) async {
    try {
      var response = await dio.get(endPoint);
      return response;
    } catch (e) {
      throw Exception("Error message : $e");
    }
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
  //vaccinationmere/rendezvousmere
}
