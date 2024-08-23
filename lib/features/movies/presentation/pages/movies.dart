import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/core/constants/color_constants.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_event.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:movie/features/movies/presentation/widgets/now_playing/now_playing.dart';
import 'package:movie/features/movies/presentation/widgets/upcoming_movies/upcoming_movies.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        backgroundColor: ColorConstants.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: ColorConstants.backgroundColor,
          title: const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              "Movies",
              style: TextStyle(color: Colors.white),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Now Playing",
              ),
              Tab(
                text: "Upcoming Movies",
              )
            ],
            labelStyle: TextStyle(color: Colors.white),
            labelColor: Colors.white,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.white,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: PopupMenuButton<String>(
                icon: const Icon(Icons.language),
                iconColor: Colors.white,
                itemBuilder: (context) => const [
                  PopupMenuItem(value: "kn", child: Text("kannada")),
                  PopupMenuItem(value: "ta", child: Text("Tamil")),
                  PopupMenuItem(
                    value: "te",
                    child: Text("Telugu"),
                  ),
                  PopupMenuItem(
                    value: "ml",
                    child: Text("Malayalam"),
                  ),
                  PopupMenuItem(value: "hi", child: Text("Hindi")),
                  PopupMenuItem(value: "gu", child: Text("Gujarati")),
                  PopupMenuItem(value: "bn", child: Text("Bengali")),
                ],
                offset: const Offset(0, 100),
                color: Colors.grey,
                elevation: 2,
                onSelected: (value) {
                  context.read<NowPlayingMovieBloc>().add(OnNowPlayingLanguageChange(value));
                  context.read<UpComingMoviesBloc>().add(OnUpcomingLanguageChange(value));
                },
              ),
            ),
          ],
        ),
        body:
            const TabBarView(children: [NowPlayingMovies(), UpComingMovies()]),
      ),
    );
  }
}
