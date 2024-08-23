import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:movie/features/movies/domain/usecases/get_upcoming_movies_usecases.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_state.dart';

import '../../../../../helpers/test_helpers/test_helpers.mocks.dart';

void main() {
  late UpComingMoviesBloc upComingMoviesBloc;
  late MockGetUpcomingMoviesUseCases mockGetUpcomingMoviesUseCases;

 
  const String language = "Kn";
  const UpcomingMoviesParams  locationParams = UpcomingMoviesParams(language: language);
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
    mockGetUpcomingMoviesUseCases = MockGetUpcomingMoviesUseCases();
    upComingMoviesBloc = UpComingMoviesBloc(mockGetUpcomingMoviesUseCases);
  });

  test("Should emit [ NowPlayingMoviesEmptyState ] state", () {
    expect(upComingMoviesBloc.state, UpcomingMoviesEmptyState());
  });

 blocTest<UpComingMoviesBloc, UpcomingMoviesState>(
     "should emit [NowPlayingMoviesLoadingState, NowPlayingMoviesLoadedState] when data is gotten ",
      build: () {
        when(mockGetUpcomingMoviesUseCases(locationParams))
            .thenAnswer((_) async => Right(movieResultEntities));

        return upComingMoviesBloc;
      },
      act: (bloc) => bloc.add(OnUpcomingLanguageChange(language)),
      expect: () => [
            UpcomingMoviesLoadingState(),
            UpcomingMoviesLoadedState(movieResultEntities)
          ]);
   blocTest<UpComingMoviesBloc, UpcomingMoviesState>(
     "should emit [NowPlayingMoviesLoadingState, NowPlayingMoviesErrorState] when data is gotten ",
      build: () {
       when(mockGetUpcomingMoviesUseCases(locationParams))
            .thenAnswer((_) async => const Left(ServerError(message: "Server Error")));

        return upComingMoviesBloc;
      },
        act: (bloc) => bloc.add(OnUpcomingLanguageChange(language)),
       expect: () => [
            UpcomingMoviesLoadingState(),
            UpcomingMoviesErrorState(error: "Server Error")
          ]);
  
}
