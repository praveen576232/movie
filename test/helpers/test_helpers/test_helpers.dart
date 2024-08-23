import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:movie/core/connectivity/connectivity.dart';
import 'package:movie/core/local_data_base/local_data_base.dart';
import 'package:movie/features/movies/data/datasource/local_datasource/local_datasource.dart';
import 'package:movie/features/movies/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:movie/features/movies/domain/repositories/get_movies_repositories.dart';
import 'package:movie/features/movies/domain/usecases/get_nowplaying_movies_usescases.dart';
import 'package:movie/features/movies/domain/usecases/get_upcoming_movies_usecases.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks([
  GetMoviesRepositories,
  GetMoviesRemoteDataSource,
  LocalDataBase,
  GetMoviesLocalDataSource,
  NetworkConnectivity,
  GetNowPlayingMoviesUseCases,
  GetUpcomingMoviesUseCases,
], customMocks: [
  MockSpec<Dio>(as: #MockDioClint),
  MockSpec<SharedPreferences>(as: #MockSharedPreferences),
  MockSpec<Connectivity>(as: #MockConnectivity)
])
void main() {}

