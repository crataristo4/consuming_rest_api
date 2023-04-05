import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();

  @override
  List<Object?> get props => [];
}

class NoInternetFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'No internet';
}

class ServerFailure extends Failure {
  const ServerFailure({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class Maintenance extends Failure {
  const Maintenance({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class SessionTimeOut extends Failure {
  const SessionTimeOut({required this.message});

  final String message;

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'No Cache';
}

class NoEntityFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'No Entity';
}

class PendingFailure extends Failure {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Pending Failure';
}

class UpdateRequiredFailure extends Failure {
  const UpdateRequiredFailure({this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

class NullFailure extends Failure {
  @override
  List<Object> get props => [];
}

class UnknownFailure extends Failure {
  const UnknownFailure({this.message});

  final String? message;

  @override
  List<Object> get props => [message!];

  @override
  String toString() => 'Unknown Failure';
}

class FailureToMessage {
  static String mapFailureToMessage(Failure failure) {
    var message = 'An Error occurred, please try again';
    if (failure is NoInternetFailure) {
      message = 'Please check your internet connection and try again';
    } else if (failure is ServerFailure) {
      message = failure.message;
    } else if (failure is CacheFailure || failure is NoEntityFailure) {
      message = 'Entity no found, please try again';
    } else if (failure is PendingFailure) {
      message = 'Request is pending, please try again later';
    } else if (failure is UpdateRequiredFailure) {
      message = failure.message ?? 'Update required';
    } else if (failure is UnknownFailure) {
      message = failure.message ?? 'Unknown failure';
    }
    return message;
  }
}
