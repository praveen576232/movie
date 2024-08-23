import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie/features/movies/domain/usecases/get_upcoming_movies_usecases.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_event.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_state.dart';

class UpComingMoviesBloc extends Bloc<UpComingMoviesEvent, UpcomingMoviesState> {
  final GetUpcomingMoviesUseCases _getUpcomingMoviesUseCases;
  UpComingMoviesBloc(this._getUpcomingMoviesUseCases)
      : super(UpcomingMoviesEmptyState()) {
    on<OnUpcomingLanguageChange>((event, emit) async {
      emit(UpcomingMoviesLoadingState());
      final result = await _getUpcomingMoviesUseCases(
          UpcomingMoviesParams(language: event.languageCode));
      result.fold((failure) {
        emit(UpcomingMoviesErrorState(error: failure.message));
      }, (data) {
        emit(UpcomingMoviesLoadedState(data));
      });
    });
  }
}
