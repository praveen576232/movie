import 'package:movie/core/constants/url_constants.dart';
import 'package:movie/core/error/server_expection.dart';
import 'package:movie/features/movies/data/models/movies_model.dart';
import 'package:dio/dio.dart';

abstract class GetMoviesRemoteDataSource {
  Future<MovieResultModel> getUpcomingMovies({required String languageCode});
  Future<MovieResultModel> getNowPlayingMovies({required String languageCode});
}

class GetMoviesRemoteDataSourceImp extends GetMoviesRemoteDataSource {
  final Dio _dio;
  GetMoviesRemoteDataSourceImp(this._dio);
  @override
  Future<MovieResultModel> getNowPlayingMovies(
      {required String languageCode}) async {
    final result = await _dio
        .get(UrlConstants.getNowPlayingMovies(languageCode: languageCode));
    if (result.statusCode == 200) {
      return MovieResultModel.fromJson(result.data);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<MovieResultModel> getUpcomingMovies(
      {required String languageCode}) async {
    final result = await _dio
        .get(UrlConstants.getUpcomingMovies(languageCode: languageCode));
   
    if (result.statusCode == 200) {
      return MovieResultModel.fromJson(result.data);
    } else {
      throw ServerException();
    }
  }
}
