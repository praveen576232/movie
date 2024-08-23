// ignore_for_file: annotate_overrides, overridden_fields

import 'package:movie/features/movies/domain/entities/movie_entities.dart';

class MovieResultModel extends MoviesResultEntities {
  final List<MovieModule> movies;
  final int? page;
  final int? totalPages;
  final int? totalResults;
  const MovieResultModel({
    required this.movies,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  }) : super(
            movies: movies,
            page: page,
            totalPages: totalPages,
            totalResults: totalResults);

  @override
  get props => [movies, page, totalPages, totalResults];

  factory MovieResultModel.fromJson(Map<String, dynamic> json) =>
      MovieResultModel(
          movies: json['results']
                  ?.map<MovieModule>((e) => MovieModule.fromJson(e))
                  ?.toList() ??
              [],
          page: json['page'],
          totalPages: json['total_pages'],
          totalResults: json['total_results']);

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": movies.map<Map<String, dynamic>>((e) => e.toJson()).toList(),
        "total_pages": totalPages,
        "total_results": totalResults
      };
  MoviesResultEntities toEntities() => MoviesResultEntities(
      movies: movies.map((e) => e.toEntities()).toList(),
      page: page,
      totalPages: totalPages,
      totalResults: totalResults);
}

class MovieModule extends MovieEntities {
  final int id;
  final String? title;
  final String? overview;
  final String? originalTitle;
  final String? posterPath;
  final String? releaseDate;
  const MovieModule({
    required this.id,
    required this.title,
    required this.overview,
    required this.originalTitle,
    required this.posterPath,
    required this.releaseDate,
  }) : super(
            id: id,
            originalTitle: originalTitle,
            overview: overview,
            posterPath: posterPath,
            releaseDate: releaseDate,
            title: title);

  @override
 get props {
    return [
      id,
      title,
      overview,
      originalTitle,
      posterPath,
      releaseDate,
    ];
  }

  factory MovieModule.fromJson(Map<String, dynamic> json) => MovieModule(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      releaseDate: json['release_date']);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "overview": overview,
        "original_title": originalTitle,
        "poster_path": posterPath,
        "release_date": releaseDate
      };

  MovieEntities toEntities() => MovieEntities(
      id: id,
      title: title,
      overview: overview,
      originalTitle: originalTitle,
      posterPath: posterPath,
      releaseDate: releaseDate);
}
