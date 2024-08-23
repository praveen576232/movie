import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:movie/core/connectivity/connectivity.dart';
import 'package:movie/core/error/failure.dart';
import 'package:movie/core/error/server_expection.dart';
import 'package:movie/features/movies/data/datasource/local_datasource/local_datasource.dart';
import 'package:movie/features/movies/data/datasource/remote_datasource/remote_datasource.dart';
import 'package:movie/features/movies/domain/entities/movie_entities.dart';
import 'package:movie/features/movies/domain/repositories/get_movies_repositories.dart';

class GetMovieRepositoriesImp extends GetMoviesRepositories {
  final GetMoviesRemoteDataSource _getMoviesRemoteDataSource;
  final GetMoviesLocalDataSource _getMoviesLocalDataSource;
  final NetworkConnectivity _networkConnectivity;
  GetMovieRepositoriesImp(this._getMoviesRemoteDataSource,
      this._getMoviesLocalDataSource, this._networkConnectivity);

  @override
  Future<Either<Failure, MoviesResultEntities>> getNowPlayingMovies(
      {required String language}) async {
    if (await _networkConnectivity.isInternetConnected()) {
      try {
        final result = await _getMoviesRemoteDataSource.getNowPlayingMovies(
            languageCode: language);
         await _getMoviesLocalDataSource.saveNowPlayingMovies(result);
        return Right(result.toEntities());
      } on ServerException {
        return const Left(ServerError(message: "Server Error"));
      } on SocketException {
        return const Left(ConnectionError(message: "Network Error"));
      }
    } else {
      final result = _getMoviesLocalDataSource.getNowPlayingMovies();
      return Right(result.toEntities());
    }
  }

  @override
  Future<Either<Failure, MoviesResultEntities>> getUpcomingMovies(
      {required String language}) async {
    if (await _networkConnectivity.isInternetConnected()) {
      try {
        final result = await _getMoviesRemoteDataSource.getUpcomingMovies(
            languageCode: language);
           await _getMoviesLocalDataSource.saveUpcomingMovies(result);
        return Right(result.toEntities());
      } on ServerException {
        return const Left(ServerError(message: "Server Error"));
      } on SocketException {
        return const Left(ConnectionError(message: "Network Error"));
      }
    } else {
      final result = _getMoviesLocalDataSource.getUpcomingMovies();
      return Right(result.toEntities());
    }
  }
}
