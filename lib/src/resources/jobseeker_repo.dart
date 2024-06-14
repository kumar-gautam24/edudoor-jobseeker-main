import 'package:dio/dio.dart';
import 'package:edudoor_jobseeker/src/models/jobseeker_model.dart';
import 'package:edudoor_jobseeker/src/services/http/jobseeker_service.dart';

class JobseekerRepo {
  Future<Map<String, dynamic>> sendOTP({required String phone, required bool isWhatsapp}) async {
    try {
      final Response response = await JobseekerService.post("send-otp", data: {"phone": phone, "isWhatsapp": isWhatsapp});
      return Map<String, dynamic>.from(response.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOTP({required String phone, required String hash, required int otp, required bool isWhatsapp}) async {
    try {
      final Response response = await JobseekerService.post("verify-otp", data: {"phone": phone, "hash": hash, "otp": otp, "isWhatsapp": isWhatsapp});
      final responseData = Map<String, dynamic>.from(response.data);
      JobseekerModel jobseeker = JobseekerModel.fromJson(responseData['jobseeker']);
      return {"jobseeker": jobseeker, "accessToken": responseData['accessToken'], "refreshToken": responseData['refreshToken'], "refreshTokenExpiresIn": responseData['refreshTokenExpiresIn']};
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> refreshToken({required String refreshToken, Options? options}) async {
    try {
      final Response response = await JobseekerService.refreshToken("refresh-token", data: {"refreshToken": refreshToken}, options: options);
      final responseData = Map<String, dynamic>.from(response.data);
      JobseekerModel jobseeker = JobseekerModel.fromJson(responseData['jobseeker']);
      return {"jobseeker": jobseeker, "accessToken": responseData['accessToken'], "refreshToken": responseData['refreshToken'], "refreshTokenExpiresIn": responseData['refreshTokenExpiresIn']};
    } catch (error) {
      rethrow;
    }
  }

  Future<JobseekerModel> getUserInfo() async {
    try {
      final Response response = await JobseekerService.get("jobseekers");
      return JobseekerModel.fromJson(Map<String, dynamic>.from(response.data)['jobseeker']);
    } catch (error) {
      rethrow;
    }
  }

  Future<JobseekerModel> updateJobseeker({required Map<String, Object?> data}) async {
    try {
      final Response response = await JobseekerService.put("jobseekers", data: data);
      return JobseekerModel.fromJson(Map<String, dynamic>.from(response.data)['jobseeker']);
    } catch (error) {
      rethrow;
    }
  }

  Future<JobseekerModel> uploadJobseeker({required Object? data}) async {
    try {
      final Response response = await JobseekerService.put("jobseekers/upload", data: data);
      return JobseekerModel.fromJson(Map<String, dynamic>.from(response.data)['jobseeker']);
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> logout({required String refreshToken}) async {
    try {
      final Response response = await JobseekerService.post("logout", data: {"refreshToken": refreshToken});
      return Map<String, dynamic>.from(response.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendEmailOtp({required String email}) async {
    try {
      final Response response = await JobseekerService.post("send-email-otp", data: {'email': email});
      return Map<String, dynamic>.from(response.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<JobseekerModel> verifyEmailOtp({required String email, required String hash, required int otp}) async {
    try {
      final Response response = await JobseekerService.post("verify-email-otp", data: {"email": email, "hash": hash, "otp": otp});
      final responseData = Map<String, dynamic>.from(response.data);
      return JobseekerModel.fromJson(responseData['jobseeker']);
    } catch (error) {
      rethrow;
    }
  }
}
