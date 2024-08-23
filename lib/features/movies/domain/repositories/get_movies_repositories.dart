import 'package:dartz/dartz.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';

abstract class GetMoviesRepositories {
  Future<Either<Failure, MoviesResultEntities>> getUpcomingMovies(
      {required String language});
  Future<Either<Failure, MoviesResultEntities>> getNowPlayingMovies(
      {required String language});
}
