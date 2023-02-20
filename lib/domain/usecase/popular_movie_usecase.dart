import 'package:dartz/dartz.dart';

import '../../core/error/failure.dart';
import '../entities/popular_movie_entity.dart';
import '../repo/repo.dart';
import 'base_usecase.dart';


class PopularUseCase extends BaseUseCase<NoParam, List<Movie>> {
  final BaseRepository repository;

  PopularUseCase(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> execute(
      NoParam param) async {
    return await repository.getPopularMovie();
  }
}

class NoParam {}
