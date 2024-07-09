import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/user_model.dart';

class AuthProvider {
  Future<EitherAuthUserOrAuthError> registerUser(
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
        path: "/api/register",
        data: {
          "name": userName,
          "email": email,
          "phone_code": phoneCode,
          "phone_number": phoneNumber,
          "password_confirmation": passwordConfirmation,
          "password": password,
          "country": country,
          "date_of_birth": dateOfBirth,
          "gender": gender,
        },
      );
      print(response);
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      return left(AuthError(errorMessage: "From Dio: ${e.message}"));
    } catch (e) {
      logger.e(e.toString());
      return left(AuthError(errorMessage: "Normal Error: ${e.toString()}"));
    }
  }
}
