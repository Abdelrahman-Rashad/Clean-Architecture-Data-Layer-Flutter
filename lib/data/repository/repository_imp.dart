import 'package:data_layer/core/error/exceptions.dart';
import 'package:data_layer/data/datasource/remote_movie_data_source.dart';
import 'package:data_layer/domain/entities/popular_movie_entity.dart';

import 'package:data_layer/core/error/failure.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repo/repo.dart';

class MovieRepository extends BaseRepository{

  BaseRemoteMovieDataSource baseRemoteMovieDataSource;
  MovieRepository({required this.baseRemoteMovieDataSource});
  @override
  Future<Either<Failure, List<Movie>>> getPopularMovie()async {
    try{
      final result=await baseRemoteMovieDataSource.getPopularMovie();
      return Right(result);
    }on ServerException catch(e){
      return Left(ServerError(e.errorMassageModel.statusCode,e.errorMassageModel.statusMessage));
    } 
  }

}