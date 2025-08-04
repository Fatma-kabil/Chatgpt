
import 'package:dio/dio.dart';

/// Base failure class
abstract class Failure {
  final String message;

  const Failure(this.message);
}

// ---------------------
// Server/API Failure
// ---------------------
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(super.message, {this.statusCode});

  factory ServerFailure.fromDioException(DioException dioExcep) {
    switch (dioExcep.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioExcep.response!.statusCode!, dioExcep.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');

      case DioExceptionType.connectionError:
        return ServerFailure('Connection Error with ApiServer');

      case DioExceptionType.unknown:
        if (dioExcep.message!.contains('SocketException')) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected error occurred, Please try later!');

      // Default case for any unhandled Dio exception types
      default:
        return ServerFailure('Something went wrong. Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic data) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(
        data?['error']?['message'] ?? 'Authentication or permission error.',
        statusCode: statusCode,
      );
    } else if (statusCode == 404) {
      return ServerFailure('Requested resource not found.', statusCode: statusCode);
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error.', statusCode: statusCode);
    } else {
      return ServerFailure('Server error: $statusCode', statusCode: statusCode);
    }
  }
}

// ---------------------
// Network Failure
// ---------------------
class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

// ---------------------
// Auth Failure
// ---------------------
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

// ---------------------
// Validation Failure
// ---------------------
class ValidationFailure extends Failure {
  final Map<String, String>? fieldErrors;

  const ValidationFailure(super.message, {this.fieldErrors});
}

// ---------------------
// Cache Failure
// ---------------------
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

// ---------------------
// Unexpected Failure
// ---------------------
class UnexpectedFailure extends Failure {
  const UnexpectedFailure(super.message);
}
