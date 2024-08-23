// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class MoviesResultEntities extends Equatable {
  final List<MovieEntities> movies;
  final int? page;
  final int? totalPages;
  final int? totalResults;
  const MoviesResultEntities({
    required this.movies,
    required this.page,
    required this.totalPages,
    required this.totalResults,
  });

  @override
  get props => [movies, page, totalPages, totalResults];
}

class MovieEntities extends Equatable {
  final int id;
  final String? title;
  final String? overview;
  final String? originalTitle;
  final String? posterPath;
  final String? releaseDate;
  const MovieEntities({
    required this.id,
    required this.title,
    required this.overview,
    required this.originalTitle,
    required this.posterPath,
    required this.releaseDate,
  });

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
}
