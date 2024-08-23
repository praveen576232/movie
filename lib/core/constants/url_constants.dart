import 'package:movie/core/extension/date_formate.dart';

class UrlConstants {
  static String host = "https://api.themoviedb.org";
  static String imageHost = "https://image.tmdb.org/t/p/w780";
  static const String _apiKey = "301e0e51abbe2deb9a2c86d5a4ec9514";
  static String getUpcomingMovies({required String languageCode}) =>
      "$host//3/discover/movie?api_key=$_apiKey&region=IN&language=$languageCode-IN&release_date.gte=${DateTime.now().add(const Duration(days:30)).convertYYYYMMDD}&with_release_type=3%7C2&with_original_language=$languageCode";
  static String getNowPlayingMovies({required String languageCode}) =>
      "$host//3/discover/movie?api_key=$_apiKey&region=IN&language=$languageCode-IN&release_date.gte=${DateTime.now().convertYYYYMMDD}&with_release_type=3%7C2&with_original_language=$languageCode";
}
