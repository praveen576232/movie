// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie/core/error/failure.dart';
import 'package:movie/core/usescase/usecases.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:movie/features/movies/domain/repositories/get_movies_repositories.dart';

class GetNowPlayingMoviesUseCases
    implements UseCases<MoviesResultEntities, NowPlayingMoviesParams> {
  final GetMoviesRepositories _getMoviesRepositories;
  GetNowPlayingMoviesUseCases(this._getMoviesRepositories);
  @override
  Future<Either<Failure, MoviesResultEntities>> call(NowPlayingMoviesParams params) {
    return _getMoviesRepositories.getNowPlayingMovies(
        language: params.language);
  }
}

class NowPlayingMoviesParams extends Equatable {
  final String language;
  const NowPlayingMoviesParams({
    required this.language,
  });
  @override
  List<Object> get props => [language];
}
