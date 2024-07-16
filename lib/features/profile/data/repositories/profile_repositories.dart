// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
import 'package:matchup/features/profile/data/models/create_user_sport_model.dart';
import 'package:matchup/features/profile/data/models/profile_error_model.dart';
import 'package:matchup/features/profile/data/models/user_profile_model.dart';
import 'package:matchup/features/profile/data/providers/profile_provider.dart';

class ProfileRepository {
  final ProfileProvider provider;
  ProfileRepository({
    required this.provider,
  });

  Future<EitherAllSportsDataModelOrProfileError> getSports(
      {required String authToken}) async {
    try {
      final response = await provider.getSports(authToken: authToken);
      return right(AllSportsDataModel.fromJson(response));
    } on DioException catch (e) {
      return left(
        ProfileError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(ProfileError(errorMessage: e.toString()));
    }
  }

  Future<EitherCreateUserSportModelOrProfileError> createUserSports(
      {required String authToken,
      required List<Map<String, dynamic>> sports}) async {
    try {
      final response =
          await provider.createUserSports(authToken: authToken, sports: sports);
      return right(CreateUserSportModel.fromJson(response));
    } on DioException catch (e) {
      return left(
        ProfileError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(ProfileError(errorMessage: e.toString()));
    }
  }

  Future<EitherUserOrProfileError> getUser({
    required String authToken,
  }) async {
    try {
      final response = await provider.getUser(
        authToken: authToken,
      );
      return right(UserProfileModel.fromJson(response));
    } on DioException catch (e) {
      return left(
        ProfileError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(ProfileError(errorMessage: e.toString()));
    }
  }
}
