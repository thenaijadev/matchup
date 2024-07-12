import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/core/utils/logger.dart';

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
    logger.i({
      "name": userName,
      "email": email,
      "phone_code": phoneCode,
      "phone_number": phoneNumber,
      "password_confirmation": passwordConfirmation,
      "password": password,
      "country": country,
      "date_of_birth": dateOfBirth,
      "gender": gender,
    });

    try {
      final response = await DioClient.instance.post(
        path: AiRoutes.signUp,
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
    logger.i({
      "password": password,
      "email": email,
    });

    try {
      final response =
          await DioClient.instance.post(path: AiRoutes.login, data: {
        "password": password,
        "email": email,
      });

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
