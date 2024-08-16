import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class AuthProvider {
  Future<Map<String, dynamic>> registerUser(
      {required String userName,
      required String email,
      required String phoneCode,
      required String phoneNumber,
      required String passwordConfirmation,
      required String password,
      required String country,
      required String dateOfBirth,
      required String gender}) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.signUp,
        data: {
          "name": userName,
          "email": email,
          "phone_code": phoneCode,
          "phone_number": phoneNumber,
          "password_confirmation": passwordConfirmation,
          "password": password,
        },
        options: Options(
          headers: {
            "Accept": "application/json",
          },
        ),
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response =
          await DioClient.instance.post(path: ApiRoutes.login, data: {
        "password": password,
        "email": email,
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> updateUser({
    required String dateOfBirth,
    required String gender,
    required String location,
    required XFile image,
    required String authToken,
  }) async {
    final formData = FormData.fromMap({
      "date_of_birth": dateOfBirth,
      "gender": gender,
      "location": location,
      'profile_image': await MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      )
    });

    try {
      final response = await DioClient.instance.post(
          path: ApiRoutes.updateProfile,
          data: formData,
          options: Options(
            headers: {"Authorization": "Bearer $authToken"},
          ));

      return response;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> requestOtp({
    required String email,
  }) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.requestOtp,
        data: {"email": email},
      );

      return response;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> verifyOtp(
      {required String otp, required String email}) async {
    try {
      final response = await DioClient.instance.post(
        path: ApiRoutes.verifyOtp,
        data: {"email": email, "otp": otp},
      );

      return response;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> changePassword(
      {required String password,
      required String confirmPassword,
      required String token}) async {
    try {
      final response = await DioClient.instance.post(
          path: ApiRoutes.resetPassword,
          data: {"password": password, "password_confirmation": password},
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ));

      return response;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendFcm() async {
    try {
      final user = await LocalDataSource().getUser();
      final fcm = await FirebaseMessaging.instance.getToken();

      final response = await DioClient.instance.post(
          path: ApiRoutes.sendFcm,
          data: {"fcm_device_token": fcm},
          options: Options(
            headers: {"Authorization": "Bearer ${user?.token}"},
          ));

      return response;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
  // Future<Map<String, dynamic>> getSports() async {
  //   try {
  //     final response = await DioClient.instance.get(
  //       path: ApiRoutes.getUserSports,
  //     );
  //     logger.f(response);
  //     return response;
  //   } catch (e) {
  //     logger.e(e.toString());
  //     rethrow;
  //   }
  // }
}
