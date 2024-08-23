import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie/core/constants/color_constants.dart';
import 'package:movie/core/constants/url_constants.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.moviesResultEntities});
  final MoviesResultEntities? moviesResultEntities;
  @override
  Widget build(BuildContext context) {
    return (moviesResultEntities != null &&
            (moviesResultEntities?.movies.isEmpty ?? true))
        ? const Center(
            child: Text(
              "No Movies",
              style: TextStyle(color: Colors.white),
            ),
          )
        : GridView.builder(
            itemCount: moviesResultEntities?.movies.length ?? 10,
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: moviesResultEntities == null
                    ? Container(
                        color: ColorConstants.imageBackgroundColor,
                      )
                    : moviesResultEntities?.movies[index].posterPath?.isEmpty ??
                            true
                        ? Container(
                            alignment: Alignment.center,
                            color: ColorConstants.imageBackgroundColor,
                            child: Text(
                              moviesResultEntities
                                      ?.movies[index].originalTitle ??
                                  moviesResultEntities?.movies[index].title ??
                                  "No Title",
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.white),
                            ),
                          )
                        : Image.network(
                            "${UrlConstants.imageHost}${moviesResultEntities?.movies[index].posterPath}",
                            fit: BoxFit.fill,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                              color: ColorConstants.imageBackgroundColor,
                            ),
                          ),
              ),
            ),
          );
  }
}
