import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/user_model.dart';
import 'package:matchup/features/auth/data/providers/auth_provider.dart';

class AuthRepository {
  final AuthProvider provider;
  AuthRepository({
    required this.provider,
  });

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
    try {
      final response = await provider.registerUser(
          gender: gender,
          userName: userName,
          email: email,
          phoneCode: phoneCode,
          phoneNumber: phoneNumber,
          passwordConfirmation: passwordConfirmation,
          password: password,
          country: country,
          dateOfBirth: dateOfBirth);
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      return left(
        AuthError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<EitherAuthUserOrAuthError> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await provider.login(email: email, password: password);
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      return left(
        AuthError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(
        AuthError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
