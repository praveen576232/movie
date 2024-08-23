import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_event.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:movie/injection_container.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:movie/features/movies/presentation/pages/movies.dart';
GlobalKey key = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => locator<NowPlayingMovieBloc>()
              ..add(OnNowPlayingLanguageChange("kn"))),
        BlocProvider(
            create: (_) => locator<UpComingMoviesBloc>()
              ..add(OnUpcomingLanguageChange("kn"))),
      ],
      child: const MaterialApp(
       
        debugShowCheckedModeBanner: false,
        home: MoviePage(),
      ),
    );
  }
}
