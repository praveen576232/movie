import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:movie/features/movies/data/models/movies_model.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';

import '../../../../helpers/read_json/read_json.dart';

void main() {
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

  Map<String, dynamic> movieResultJson = {
    "page": 1,
    "results": [
      {
        "id": 1219162,
        "original_title": "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
        "overview": "",
        "poster_path": "/ovWLBAAT7NEm69bF6Ndn8btWgsU.jpg",
        "release_date": "2024-04-01",
        "title": "ಸಂಜು ವೆಡ್ಸ್ ಗೀತಾ 2",
      }
    ],
    "total_pages": 1,
    "total_results": 7
  };

  Map<String, dynamic> movieResultNullJson = {
    "page": 1,
    "results": [],
    "total_pages": 1,
    "total_results": 7
  };
  test("should be sub class of movie result entities", () {
    expect(movieResultModel, isA<MoviesResultEntities>());
  });

  group("Should return valid movie result model for json", () {
    test("should return valid model for json", () {
      // arrange
      final Map<String, dynamic> json =
          jsonDecode(readJson("helpers/dummy_data/movies_data.json"));
      // act
      final result = MovieResultModel.fromJson(json);
      // assert
      expect(result, equals(movieResultModel));
    });

    test("should return valid model for json if results are null", () {
      // arrange
      final Map<String, dynamic> json =
          jsonDecode(readJson("helpers/dummy_data/movies_null_data.json"));
      // act
      final result = MovieResultModel.fromJson(json);
      // assert
      expect(result, equals(movieResultNullModel));
    });
  });

  group("Should return valid json for movies result model", () {
    test("should return valid json for  movies model ", () {
      // arrange

      // act
      final result = movieResultModel.toJson();
      // assert
      expect(result, equals(movieResultJson));
    });

    test("should return valid model for json if movies are null", () {
      // arrange

      // act
      final result = movieResultNullModel.toJson();
      // assert
      expect(result, equals(movieResultNullJson));
    });
  });
}
