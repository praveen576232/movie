import 'package:equatable/equatable.dart';

abstract class UpComingMoviesEvent extends Equatable {}

class OnUpcomingLanguageChange extends UpComingMoviesEvent {
  final String languageCode;
  OnUpcomingLanguageChange(this.languageCode);
  @override
  List<Object?> get props => [languageCode];
}
