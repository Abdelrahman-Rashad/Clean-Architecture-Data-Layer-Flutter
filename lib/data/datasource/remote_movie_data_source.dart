import 'package:data_layer/core/constanst/app_constants.dart';
import 'package:data_layer/core/dataprovider/remote/diohelper.dart';
import 'package:data_layer/core/error/error_massage_model.dart';
import 'package:data_layer/core/error/exceptions.dart';
import 'package:data_layer/data/models/movie_model.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteMovieDataSource{
  Future<List<MovieModel>> getPopularMovie();
}

class RemoteMovieDataSource extends BaseRemoteMovieDataSource{
  @override
  Future<List<MovieModel>> getPopularMovie()async {
    Response response =await DioHelper().getData(endpoint: AppConstants.ENDPOINT);
    if(response.statusCode==200){
      return (response.data["results"] as List).map((e) => MovieModel.fromjson(e)).toList();
    }
    else{
      throw ServerException(errorMassageModel: ErrorMassageModel.fromJson(response.data));
    }
  }
}