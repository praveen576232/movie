import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/core/constants/transltion_keys.dart';
import 'package:movie/features/movies/data/datasource/local_datasource/local_datasource.dart';
import 'package:movie/features/movies/data/models/movies_model.dart';

import '../../../../../helpers/test_helpers/test_helpers.mocks.dart';

void main() {
  late MockLocalDataBase mockLocalDataBase;
  late GetMoviesLocalDataSourceImp getMoviesLocalDataSourceImp;

  setUp(() {
    mockLocalDataBase = MockLocalDataBase();
    getMoviesLocalDataSourceImp =
        GetMoviesLocalDataSourceImp(mockLocalDataBase);
  });
  MovieResultModel movieResultModel = const MovieResultModel(movies: [
    MovieModule(
        id: 1219162,
        title: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        overview: "",
        originalTitle: "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        posterPath: "/ovWLBAAT7NEm69bF6Ndn8btWgsU.jpg",
        releaseDate: "2024-04-01")
  ], page: 1, totalPages: 1, totalResults: 7);

  MovieResultModel movieResultNullModel = const MovieResultModel(
      movies: [], page: null, totalPages: null, totalResults: null);

  group("Now playing movie local data base test", () {
    test("should return Empty Now playing Movie model when its first time", () {
      // arrange
      when(mockLocalDataBase
              .getJsonObject(TranslationsKeys.storeNowPlayingMovies))
          .thenAnswer((_) => {});
      // act
      final result = getMoviesLocalDataSourceImp.getNowPlayingMovies();
      expect(result, equals(movieResultNullModel));
    });

    test("should return true when save now playing movie model", () async {
      // arrange
      when(mockLocalDataBase.saveJsonObject(
              TranslationsKeys.storeNowPlayingMovies,
              (movieResultModel.toJson())))
          .thenAnswer((_) async => true);
      // act
      final result = await getMoviesLocalDataSourceImp
          .saveNowPlayingMovies(movieResultModel);
      expect(result, equals(true));
    });
    test("should return  Now playing Movie model", () {
      // arrange
      when(mockLocalDataBase
              .getJsonObject(TranslationsKeys.storeNowPlayingMovies))
          .thenAnswer((_) => (movieResultModel.toJson()));
      // act
      final result = getMoviesLocalDataSourceImp.getNowPlayingMovies();
      expect(result, equals(movieResultModel));
    });
  });

  group("upcoming movie  local data base test", () {
    test("should return Empty upcoming Movie model when its first time", () {
      // arrange
      when(mockLocalDataBase
              .getJsonObject(TranslationsKeys.storeUpcomingMovies))
          .thenAnswer((_) => {});
      // act
      final result = getMoviesLocalDataSourceImp.getUpcomingMovies();
      expect(result, equals(movieResultNullModel));
    });

    test("should return true when save upcoming movie model", () async {
      // arrange
      when(mockLocalDataBase.saveJsonObject(
              TranslationsKeys.storeUpcomingMovies,
              (movieResultModel.toJson())))
          .thenAnswer((_) async => true);
      // act
      final result = await getMoviesLocalDataSourceImp
          .saveUpcomingMovies(movieResultModel);
      expect(result, equals(true));
    });
    test("should return  upcoming Movie model", () {
      // arrange
      when(mockLocalDataBase
              .getJsonObject(TranslationsKeys.storeUpcomingMovies))
          .thenAnswer((_) => (movieResultModel.toJson()));
      // act
      final result = getMoviesLocalDataSourceImp.getUpcomingMovies();
      expect(result, equals(movieResultModel));
    });
  });
}
