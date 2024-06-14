import 'package:dio/dio.dart';
import 'package:edudoor_jobseeker/src/errors/dio_exception_error_message.dart';
import 'package:edudoor_jobseeker/src/firebase/firebase_analytics.dart';
import 'package:edudoor_jobseeker/src/view/common/gradients/all_gradient.dart';
import 'package:edudoor_jobseeker/src/view/common/snack_bar/custom_get_snack_bar.dart';

class ErrorHandler {
  static void handleError(Object error, StackTrace stackTrace) {
    TrackingService.logError(error, stackTrace);

    if (error is DioException) {
      if (error.response != null && error.response!.data != null) {
        final responseData = Map<String, dynamic>.from(error.response!.data);
        final errorTitle = responseData['title'] ?? "Something went wrong";
        final errorMessage = responseData['message'] ?? "An unexpected error occurred. We are looking into it. Please try again later.";
        CustomGetSnackBar(title: errorTitle, subTitle: errorMessage, backgroundGradient: AllGradient.errorGradient).show();
        return;
      }

      const errorTitle = "Connection Error";
      final errorMessage = DioExceptionMessage.getMessage(error.type);
      CustomGetSnackBar(title: errorTitle, subTitle: errorMessage, backgroundGradient: AllGradient.errorGradient).show();
      return;
    }
  }
}
