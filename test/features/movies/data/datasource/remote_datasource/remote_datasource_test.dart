import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/core/constants/url_constants.dart';
import 'package:movie/core/error/server_expection.dart';
import 'package:movie/features/movies/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:movie/features/movies/data/models/movies_model.dart';

import '../../../../../helpers/read_json/read_json.dart';
import '../../../../../helpers/test_helpers/test_helpers.mocks.dart';

void main() {
  late MockDioClint mockDioClint;
  late GetMoviesRemoteDataSourceImp getMoviesRemoteDataSourceImp;

  setUp(() {
    mockDioClint = MockDioClint();
    getMoviesRemoteDataSourceImp = GetMoviesRemoteDataSourceImp(mockDioClint);
  });
  const String languageCode = "kn";
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
      movies: [], page: 1, totalPages: 1, totalResults: 7);

  group(
      "should return now playing movies  model if status code 200 or else throw Server Error ",
      () {
    test("should return now playing movies  model when status code is 200",
        () async {
      // arrange
      when(mockDioClint.get(
              UrlConstants.getNowPlayingMovies(languageCode: languageCode)))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(),
              data: jsonDecode(readJson("helpers/dummy_data/movies_data.json")),
              statusCode: 200));
      //  act
      final result = await getMoviesRemoteDataSourceImp.getNowPlayingMovies(
          languageCode: languageCode);
      //  assets
      expect(result, equals(movieResultModel));
    });
    test(
        "should return now playing empty movies  model when status code is 200",
        () async {
      // arrange
      when(mockDioClint.get(
              UrlConstants.getNowPlayingMovies(languageCode: languageCode)))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(),
              data: jsonDecode(
                  readJson("helpers/dummy_data/movies_null_data.json")),
              statusCode: 200));
      //  act
      final result = await getMoviesRemoteDataSourceImp.getNowPlayingMovies(
          languageCode: languageCode);
      //  assets
      expect(result, equals(movieResultNullModel));
    });
    test("should throw Server Error when status code is 404 or any", () async {
      // arrange
      when(mockDioClint.get(
              UrlConstants.getNowPlayingMovies(languageCode: languageCode)))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(), data: null, statusCode: 404));
      //  act
      final result = getMoviesRemoteDataSourceImp.getNowPlayingMovies;
      //  assets
      expect(() => result(languageCode: languageCode),
          throwsA(isA<ServerException>()));
    });
  });

  group(
      "should return upcoming movies  model if status code 200 or else throw Server Error ",
      () {
    test("should return upcoming movies  model when status code is 200",
        () async {
      // arrange
      when(mockDioClint
              .get(UrlConstants.getUpcomingMovies(languageCode: languageCode)))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(),
              data: jsonDecode(readJson("helpers/dummy_data/movies_data.json")),
              statusCode: 200));
      //  act
      final result = await getMoviesRemoteDataSourceImp.getUpcomingMovies(
          languageCode: languageCode);
      //  assets
      expect(result, equals(movieResultModel));
    });
    test("should return upcoming empty movies  model when status code is 200",
        () async {
      // arrange
      when(mockDioClint
              .get(UrlConstants.getUpcomingMovies(languageCode: languageCode)))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(),
              data: jsonDecode(
                  readJson("helpers/dummy_data/movies_null_data.json")),
              statusCode: 200));
      //  act
      final result = await getMoviesRemoteDataSourceImp.getUpcomingMovies(
          languageCode: languageCode);
      //  assets
      expect(result, equals(movieResultNullModel));
    });
    test("should throw Server Error when status code is 404 or any", () async {
      // arrange
      when(mockDioClint
              .get(UrlConstants.getUpcomingMovies(languageCode: languageCode)))
          .thenAnswer((_) async => Response(
              requestOptions: RequestOptions(), data: null, statusCode: 404));
      //  act
      final result = getMoviesRemoteDataSourceImp.getUpcomingMovies;
      //  assets
      expect(() => result(languageCode: languageCode),
          throwsA(isA<ServerException>()));
    });
  });
}
