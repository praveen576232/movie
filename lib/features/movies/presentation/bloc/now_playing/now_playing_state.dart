import 'package:equatable/equatable.dart';

import 'package:movie/features/movies/domain/entities/movie_entities.dart';

abstract class NowPlayingMoviesState extends Equatable {}

class NowPlayingMoviesEmptyState extends NowPlayingMoviesState {
  @override
  List<Object?> get props => [];
}

class NowPlayingMoviesLoadingState extends NowPlayingMoviesState {
  @override
  List<Object?> get props => [];
}

class NowPlayingMoviesLoadedState extends NowPlayingMoviesState {
  final MoviesResultEntities moviesResultEntities;
  NowPlayingMoviesLoadedState(this.moviesResultEntities);
  @override
  List<Object?> get props => [moviesResultEntities];
}

class NowPlayingMoviesErrorState extends NowPlayingMoviesState {
  final String error;
  NowPlayingMoviesErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
