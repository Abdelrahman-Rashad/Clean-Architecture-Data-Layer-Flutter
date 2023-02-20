import 'package:data_layer/core/constanst/app_constants.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: AppConstants.BASEURL,
    ));
  }

  Future<Response> getData(
      {required String endpoint, Map<String, dynamic>? queryparamter,String? token}) async {
Response response;
        try{
    response = await dio.get(endpoint, queryParameters: queryparamter);

        }on DioError catch(e){
          response=e.response!;
        }
    return response;
  }
}
/*
Response response;
        try{
    response = await dio.get(endpoint, queryParameters: queryparamter);

        }on DioError catch(e){
          response=e.response!;
        }*/
