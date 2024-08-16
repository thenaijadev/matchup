import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/auth/data/models/auth_error.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/models/otp_requested.dart';
import 'package:matchup/features/auth/data/models/otp_verification_email.dart';
import 'package:matchup/features/auth/data/models/password_reset_model.dart';
import 'package:matchup/features/auth/data/models/updated_user_model.dart';
import 'package:matchup/features/auth/data/providers/auth_provider.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class AuthRepository {
  final AuthProvider provider;
  final LocalDataSource localDataSource;
  AuthRepository({
    required this.localDataSource,
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
          errorMessage: e.response?.statusMessage ?? "There has been an error",
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
      final isSaved =
          await localDataSource.saveUser(AuthUser.fromJson(response));
      logger.f({isSaved: isSaved});
      return right(AuthUser.fromJson(response));
    } on DioException catch (e) {
      logger.f(e.response);

      return left(
        AuthError(
          errorMessage: e.response?.statusMessage ?? "",
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

  Future<EitherUpdatedUserModelOrAuthError> updateProfile(
      {required String dateOfBirth,
      required String gender,
      required String location,
      required XFile profileImage,
      required String authToken}) async {
    try {
      final response = await provider.updateUser(
          authToken: authToken,
          dateOfBirth: dateOfBirth,
          gender: gender,
          location: location,
          image: profileImage);

      return right(UpdatedUserModel.fromJson(response));
    } on DioException catch (e) {
      logger.f(e.response?.data);
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

  Future<EitherAuthErrorOrOtpRequestedModel> requestOtp({
    required String email,
  }) async {
    try {
      final res = await provider.requestOtp(email: email);

      return right(OtpRequestModel.fromJson(res));
    } on DioException catch (e) {
      return left(AuthError(errorMessage: e.response?.statusMessage ?? ""));
    } catch (e) {
      logger.e(e.toString());
      return left(AuthError(errorMessage: e.toString()));
    }
  }

  Future<EitherAuthErrorOrOtpVerificationModel> verifyOtp(
      {required String email, required String otp}) async {
    try {
      final res = await provider.verifyOtp(email: email, otp: otp);

      return right(OtpVerificationModel.fromJson(res));
    } on DioException catch (e) {
      return left(AuthError(errorMessage: e.response?.statusMessage ?? ""));
    } catch (e) {
      logger.e(e.toString());
      return left(AuthError(errorMessage: e.toString()));
    }
  }

  Future<EitherAuthErrorOrPasswordReset> changePassword(
      {required String password,
      required String confirmPassword,
      required String token}) async {
    try {
      final res = await provider.changePassword(
          token: token, password: password, confirmPassword: confirmPassword);

      return right(PasswordResetModel.fromJson(res));
    } on DioException catch (e) {
      return left(AuthError(
          errorMessage:
              e.response?.statusMessage ?? "There has been an error"));
    } catch (e) {
      logger.e(e.toString());
      return left(AuthError(errorMessage: e.toString()));
    }
  }

  Future<EitherAuthErrorOrMap> sendFcm() async {
    try {
      final res = await provider.sendFcm();

      return right(res);
    } on DioException catch (e) {
      return left(AuthError(
          errorMessage:
              e.response?.statusMessage ?? "There has been an error"));
    } catch (e) {
      logger.e(e.toString());
      return left(AuthError(errorMessage: e.toString()));
    }
  }
}
