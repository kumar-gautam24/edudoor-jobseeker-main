import 'package:dio/dio.dart';

class DioExceptionMessage {
  static String getMessage(DioExceptionType errorCode) {
    switch (errorCode) {
      case DioExceptionType.connectionError:
        return "Oops! Their is connection error. Please check your internet connection and try again";
      case DioExceptionType.connectionTimeout:
        return "Oops! It seems your connection timed out. Please check your internet connection and try again.";
      case DioExceptionType.sendTimeout:
        return "We're having trouble sending your request. Please check your internet connection and try again.";
      case DioExceptionType.receiveTimeout:
        return "It's taking longer than usual to receive a response. Please check your internet connection and try again.";
      case DioExceptionType.unknown:
        return "An unexpected error occurred. We are looking into it. Please try again later.";
      default:
        return "An unknown error occurred. We are looking into it. Please try again later.";
    }
  }
}

