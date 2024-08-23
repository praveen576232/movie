// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usescase/usecases.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:movie/features/movies/domain/repositories/get_movies_repositories.dart';

class GetUpcomingMoviesUseCases
    implements UseCases<MoviesResultEntities, UpcomingMoviesParams> {
  final GetMoviesRepositories _getMoviesRepositories;
  GetUpcomingMoviesUseCases(this._getMoviesRepositories);

  @override
  Future<Either<Failure, MoviesResultEntities>> call(
      UpcomingMoviesParams params) {
    return _getMoviesRepositories.getUpcomingMovies(language: params.language);
  }
}

class UpcomingMoviesParams extends Equatable {
  final String language;
  const UpcomingMoviesParams({
    required this.language,
  });

  @override
  List<Object> get props => [language];
}
