import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:movie/features/movies/domain/usecases/get_nowplaying_movies_usescases.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_event.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_state.dart';

import '../../../../../helpers/test_helpers/test_helpers.mocks.dart';

void main() {
  late NowPlayingMovieBloc nowPlayingMovieBloc;
  late MockGetNowPlayingMoviesUseCases mockGetNowPlayingMoviesUseCases;

 
  const String language = "Kn";
  const NowPlayingMoviesParams  locationParams = NowPlayingMoviesParams(language: language);
  MoviesResultEntities movieResultEntities =
      const MoviesResultEntities(movies: [
    MovieEntities(
        id: 1219162,
        title: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        overview: "",
        originalTitle: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        posterPath: "/ovWLBAAT7NEm69bF6Ndn8btWgsU.jpg",
        releaseDate: "2024-04-01")
  ], page: 1, totalPages: 1, totalResults: 7);

   setUp(() {
    mockGetNowPlayingMoviesUseCases = MockGetNowPlayingMoviesUseCases();
    nowPlayingMovieBloc = NowPlayingMovieBloc(mockGetNowPlayingMoviesUseCases);
  });

  test("Should emit [ NowPlayingMoviesEmptyState ] state", () {
    expect(nowPlayingMovieBloc.state, NowPlayingMoviesEmptyState());
  });

 blocTest<NowPlayingMovieBloc, NowPlayingMoviesState>(
     "should emit [NowPlayingMoviesLoadingState, NowPlayingMoviesLoadedState] when data is gotten ",
      build: () {
        when(mockGetNowPlayingMoviesUseCases.call(locationParams))
            .thenAnswer((_) async => Right(movieResultEntities));

        return nowPlayingMovieBloc;
      },
      act: (bloc) => bloc.add(OnNowPlayingLanguageChange(language)),
      expect: () => [
            NowPlayingMoviesLoadingState(),
            NowPlayingMoviesLoadedState(movieResultEntities)
          ]);
   blocTest<NowPlayingMovieBloc, NowPlayingMoviesState>(
     "should emit [NowPlayingMoviesLoadingState, NowPlayingMoviesErrorState] when data is gotten ",
      build: () {
        when(mockGetNowPlayingMoviesUseCases.call(locationParams))
            .thenAnswer((_) async => const Left(ServerError(message: "Server Error")));

        return nowPlayingMovieBloc;
      },
      act: (bloc) => bloc.add(OnNowPlayingLanguageChange(language)),
      expect: () => [
            NowPlayingMoviesLoadingState(),
            NowPlayingMoviesErrorState(error: "Server Error")
          ]);
  
}
