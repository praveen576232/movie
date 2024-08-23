import 'package:equatable/equatable.dart';

abstract class NowPlayingMoviesEvent extends Equatable {}

class OnNowPlayingLanguageChange extends NowPlayingMoviesEvent {
  final String languageCode;
  OnNowPlayingLanguageChange(this.languageCode);
  @override
  List<Object?> get props => [languageCode];
}
