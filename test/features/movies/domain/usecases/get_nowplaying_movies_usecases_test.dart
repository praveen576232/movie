import 'package:dartz/dartz.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:movie/features/movies/domain/usecases/get_nowplaying_movies_usescases.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../../../helpers/test_helpers/test_helpers.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetNowPlayingMoviesUseCases getMoviesUseCases;
  late MockGetMoviesRepositories mockGetMoviesRepositories;

  setUp(() {
    mockGetMoviesRepositories = MockGetMoviesRepositories();
    getMoviesUseCases = GetNowPlayingMoviesUseCases(mockGetMoviesRepositories);
  });
  const String language = "kn";
  const MoviesResultEntities moviesResultEntities =
      MoviesResultEntities(movies: [
    MovieEntities(
        id: 1219162,
        title: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        overview: "",
        originalTitle: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        posterPath: "/ovWLBAAT7NEm69bF6Ndn8btWgsU.jpg",
        releaseDate: "2024-04-01")
  ], page: 1, totalPages: 1, totalResults: 7);
  test("should call get now playing  movie for the language from repositories ",
      () async {
    // arrange
    when(mockGetMoviesRepositories.getNowPlayingMovies(language: language))
        .thenAnswer((_) async => const Right(moviesResultEntities));
    // act
    final result = await getMoviesUseCases(
        const NowPlayingMoviesParams(language: language));

    // assert
    expect(result, equals(const Right(moviesResultEntities)));
  });
}
