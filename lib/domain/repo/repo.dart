import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/popular_movie_entity.dart';


abstract class BaseRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovie();

}
