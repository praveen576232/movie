import 'package:equatable/equatable.dart';

import 'package:movie/features/movies/domain/entities/movie_entities.dart';

abstract class UpcomingMoviesState extends Equatable {}

class UpcomingMoviesEmptyState extends UpcomingMoviesState {
  @override
  List<Object?> get props => [];
}

class UpcomingMoviesLoadingState extends UpcomingMoviesState {
  @override
  List<Object?> get props => [];
}

class UpcomingMoviesLoadedState extends UpcomingMoviesState {
  final MoviesResultEntities moviesResultEntities;
  UpcomingMoviesLoadedState(this.moviesResultEntities);
  @override
  List<Object?> get props => [moviesResultEntities];
}

class UpcomingMoviesErrorState extends UpcomingMoviesState {
  final String error;
  UpcomingMoviesErrorState({
    required this.error,
  });
  @override
  List<Object?> get props => [error];
}
