import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/constants/color_constants.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_state.dart';
import 'package:movie/features/movies/presentation/widgets/movie_card/movie_card.dart';
import 'package:shimmer/shimmer.dart';

class NowPlayingMovies extends StatelessWidget {
  const NowPlayingMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NowPlayingMovieBloc, NowPlayingMoviesState>(
      builder: (context, state) {
        if (state is NowPlayingMoviesLoadingState) {
          return Shimmer.fromColors(
              baseColor: ColorConstants.imageBackgroundColor,
              highlightColor: Colors.grey,
              child: const MovieCard(
                moviesResultEntities: null,
              ));
        }
        if (state is NowPlayingMoviesLoadedState) {
          return MovieCard(
            moviesResultEntities: state.moviesResultEntities,
          );
        }
        if (state is NowPlayingMoviesErrorState) {
          return Center(
            child: Text(
              state.error,
              style: const TextStyle(color: Colors.white),
            ),
          );
        }
        return Container();
      },
    );
  }
}
