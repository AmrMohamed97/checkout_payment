import 'dart:convert';

import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    String? token,
    String? stripeVersion,
  }) async {
    Map<String, String> headers = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    if (stripeVersion != null) {
      Map<String, String> stripeHeaders = {"Stripe-Version": stripeVersion};
      headers.addAll(stripeHeaders);
    }
    dio.options.headers = headers;
    Response response = await dio.post(
      url,
      data: body,
      // options:
      //     Options(contentType: Headers.formUrlEncodedContentType,
      // //     headers: {
      // //   'Authorization': "Bearer $token",
      // // }
      // ),
    );
    return response;
  }
}
