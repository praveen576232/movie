import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/core/connectivity/connectivity.dart';
import 'package:movie/core/local_data_base/local_data_base.dart';
import 'package:movie/features/movies/data/datasource/local_datasource/local_datasource.dart';
import 'package:movie/features/movies/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:movie/features/movies/data/repositories/get_movies_repositories_imp.dart';
import 'package:movie/features/movies/domain/repositories/get_movies_repositories.dart';
import 'package:movie/features/movies/domain/usecases/get_nowplaying_movies_usescases.dart';
import 'package:movie/features/movies/domain/usecases/get_upcoming_movies_usecases.dart';
import 'package:movie/features/movies/presentation/bloc/now_playing/now_playing_bloc.dart';
import 'package:movie/features/movies/presentation/bloc/upcoming/upcoming_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

init()async{
  // bloc
  locator.registerFactory(() => NowPlayingMovieBloc(locator()));
  locator.registerFactory(() => UpComingMoviesBloc(locator()));
  
  // use cases
  locator.registerLazySingleton(() => GetNowPlayingMoviesUseCases(locator()));
  locator.registerLazySingleton(() => GetUpcomingMoviesUseCases(locator()));
  
  // repositories
  locator.registerLazySingleton<GetMoviesRepositories>(() => GetMovieRepositoriesImp(locator(), locator(), locator()));

  // data source
  locator.registerLazySingleton<GetMoviesRemoteDataSource>(() => GetMoviesRemoteDataSourceImp(locator()));
  locator.registerLazySingleton<GetMoviesLocalDataSource>(() => GetMoviesLocalDataSourceImp(locator()));

  // External dependence
  locator.registerLazySingleton(() => Dio());
  locator.registerLazySingleton<LocalDataBase>(() => LocalDataBaseImp(locator()));
   locator.registerLazySingleton<NetworkConnectivity>(() => NetworkConnectivityImp(locator()));
   locator.registerLazySingleton(() => Connectivity());
   final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

}