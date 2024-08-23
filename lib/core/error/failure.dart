// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerError extends Failure {
  const ServerError({required String message}) : super(message);
}

class ConnectionError extends Failure {
  const ConnectionError({required String message}) : super(message);
}
