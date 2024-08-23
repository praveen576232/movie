import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/features/movies/data/models/movies_model.dart';
import 'package:movie/features/movies/data/repositories/get_movies_repositories_imp.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';

import '../../../../helpers/test_helpers/test_helpers.mocks.dart';

void main() {
  late GetMovieRepositoriesImp getMovieRepositoriesImp;
  late MockGetMoviesRemoteDataSource mockGetMoviesRemoteDataSource;
  late MockGetMoviesLocalDataSource mockGetMoviesLocalDataSource;
  late MockNetworkConnectivity mockNetworkConnectivity;

  setUp(() {
    mockGetMoviesRemoteDataSource = MockGetMoviesRemoteDataSource();
    mockGetMoviesLocalDataSource = MockGetMoviesLocalDataSource();
    mockNetworkConnectivity = MockNetworkConnectivity();
    getMovieRepositoriesImp = GetMovieRepositoriesImp(
        mockGetMoviesRemoteDataSource,
        mockGetMoviesLocalDataSource,
        mockNetworkConnectivity);
  });

  const String language = "kn";
  MovieResultModel movieResultModel = const MovieResultModel(movies: [
    MovieModule(
        id: 1219162,
        title: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        overview: "",
        originalTitle: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        posterPath: "/ovWLBAAT7NEm69bF6Ndn8btWgsU.jpg",
        releaseDate: "2024-04-01")
  ], page: 1, totalPages: 1, totalResults: 7);
  MoviesResultEntities movieResultEntitle = const MoviesResultEntities(movies: [
    MovieEntities(
        id: 1219162,
        title: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        overview: "",
        originalTitle: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        posterPath: "/ovWLBAAT7NEm69bF6Ndn8btWgsU.jpg",
        releaseDate: "2024-04-01")
  ], page: 1, totalPages: 1, totalResults: 7);

  test(
      "should return upcoming movie result from remote  when network available",
      () async {
    // arrange
    when(mockNetworkConnectivity.isInternetConnected())
        .thenAnswer((_) async => true);
    when(mockGetMoviesRemoteDataSource.getUpcomingMovies(
            languageCode: language))
        .thenAnswer((_) async => movieResultModel);
//  act
    final result =
        await getMovieRepositoriesImp.getUpcomingMovies(language: language);

// assert
    expect(result, equals(Right(movieResultEntitle)));
  });

  test(
      "should return upcoming movie result from local  when network is not available",
      () async {
    // arrange
    when(mockNetworkConnectivity.isInternetConnected())
        .thenAnswer((_) async => false);
    when(mockGetMoviesLocalDataSource.getUpcomingMovies())
        .thenAnswer((_) => movieResultModel);
//  act
    final result =
        await getMovieRepositoriesImp.getUpcomingMovies(language: language);

// assert
    expect(result, equals(Right(movieResultEntitle)));
  });

  test(
      "should return now playing movie result from remote  when network available",
      () async {
    // arrange
    when(mockNetworkConnectivity.isInternetConnected())
        .thenAnswer((_) async => true);
    when(mockGetMoviesRemoteDataSource.getNowPlayingMovies(
            languageCode: language))
        .thenAnswer((_) async => movieResultModel);
//  act
    final result =
        await getMovieRepositoriesImp.getNowPlayingMovies(language: language);

// assert
    expect(result, equals(Right(movieResultEntitle)));
  });

  test(
      "should return now playing movie result from local  when network is not available",
      () async {
    // arrange
    when(mockNetworkConnectivity.isInternetConnected())
        .thenAnswer((_) async => false);
    when(mockGetMoviesLocalDataSource.getNowPlayingMovies())
        .thenAnswer((_) => movieResultModel);
//  act
    final result =
        await getMovieRepositoriesImp.getNowPlayingMovies(language: language);

// assert
    expect(result, equals(Right(movieResultEntitle)));
  });
}
