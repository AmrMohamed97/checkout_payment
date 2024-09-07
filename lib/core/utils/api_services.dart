import 'package:dio/dio.dart';

class ApiServices {
  Dio dio = Dio();
  Future<Response> post({required String url,required Map<String,dynamic> body,String? token}) async {
    Response response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: "application/x-www-form-urlencoded",
        headers: {
          'Authorization': "Bearer $token",
        }
      ),
      );
    return response;
  } 
}
