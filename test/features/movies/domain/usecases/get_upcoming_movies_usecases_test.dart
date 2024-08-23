import 'package:dartz/dartz.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie/features/movies/domain/usecases/get_upcoming_movies_usecases.dart';
import '../../../../helpers/test_helpers/test_helpers.mocks.dart';
import 'package:mockito/mockito.dart';

void main() {
  late GetUpcomingMoviesUseCases getUpcomingMoviesUseCases;
  late MockGetMoviesRepositories mockGetMoviesRepositories;

  setUp(() {
    mockGetMoviesRepositories = MockGetMoviesRepositories();
    getUpcomingMoviesUseCases =
        GetUpcomingMoviesUseCases(mockGetMoviesRepositories);
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
  test("should call get  upcoming movies for the language from repositories ",
      () async {
    // arrange
    when(mockGetMoviesRepositories.getUpcomingMovies(language: language))
        .thenAnswer((_) async => const Right(moviesResultEntities));
    // act
    final result = await getUpcomingMoviesUseCases(
        const UpcomingMoviesParams(language: language));

    // assert
    expect(result, equals(const Right(moviesResultEntities)));
  });
}
