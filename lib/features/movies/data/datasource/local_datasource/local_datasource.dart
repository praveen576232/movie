import 'package:movie/core/constants/transltion_keys.dart';
import 'package:movie/core/local_data_base/local_data_base.dart';
import 'package:movie/features/movies/data/models/movies_model.dart';

abstract class GetMoviesLocalDataSource {
  MovieResultModel getUpcomingMovies();
  MovieResultModel getNowPlayingMovies();
  Future<bool> saveUpcomingMovies(MovieResultModel movieResultModel);
  Future<bool> saveNowPlayingMovies(MovieResultModel movieResultModel);
}

class GetMoviesLocalDataSourceImp extends GetMoviesLocalDataSource {
  final LocalDataBase _localDataBase;
  GetMoviesLocalDataSourceImp(this._localDataBase);
  @override
  MovieResultModel getNowPlayingMovies() {
    final data =
        _localDataBase.getJsonObject(TranslationsKeys.storeNowPlayingMovies);
    return MovieResultModel.fromJson((data));
  }

  @override
  MovieResultModel getUpcomingMovies() {
    final data =
        _localDataBase.getJsonObject(TranslationsKeys.storeUpcomingMovies);
    return MovieResultModel.fromJson((data));
  }

  @override
  Future<bool> saveNowPlayingMovies(MovieResultModel movieResultModel) {
    return _localDataBase.saveJsonObject(
        TranslationsKeys.storeNowPlayingMovies, (movieResultModel.toJson()));
  }

  @override
  Future<bool> saveUpcomingMovies(MovieResultModel movieResultModel) {
    return _localDataBase.saveJsonObject(
        TranslationsKeys.storeUpcomingMovies, (movieResultModel.toJson()));
  }
}
