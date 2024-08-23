import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movies/domain/usecases/get_nowplaying_movies_usescases.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_event.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_state.dart';

class NowPlayingMovieBloc
    extends Bloc<NowPlayingMoviesEvent, NowPlayingMoviesState> {
  final GetNowPlayingMoviesUseCases _getNowPlayingMoviesUseCases;
  NowPlayingMovieBloc(this._getNowPlayingMoviesUseCases)
      : super(NowPlayingMoviesEmptyState()) {

    on<OnNowPlayingLanguageChange>((event, emit) async {

      emit(NowPlayingMoviesLoadingState());

      final result = await _getNowPlayingMoviesUseCases(
          NowPlayingMoviesParams(language: event.languageCode));
      

      result.fold((failure) {
        emit(NowPlayingMoviesErrorState(error: failure.message));
      }, (data) {
     
        emit(NowPlayingMoviesLoadedState(data));
      });


    });
  }
  
}
