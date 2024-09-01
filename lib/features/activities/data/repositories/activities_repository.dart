// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/activities/data/models/activities/activities_created_model.dart';
import 'package:matchup/features/activities/data/models/activities/activities_error.dart';
import 'package:matchup/features/activities/data/models/activities/all_activities_model.dart';
import 'package:matchup/features/activities/data/models/activities/single_activity_model.dart';
import 'package:matchup/features/activities/data/providers/activities_providers.dart';

class ActivitiesRepository {
  final ActivitiesProvider activitiesProvider;

  ActivitiesRepository({
    required this.activitiesProvider,
  });

  Future<EitherAllActivitiesModelOrActivitiesError> getActivities() async {
    try {
      final Map<String, dynamic> response =
          await activitiesProvider.getActivities();
      logger.f(response);
      final AllActivitiesModel model = AllActivitiesModel.fromJson(response);
      return right(model);
    } on DioException catch (e) {
      logger.e(e.toString());

      return left(ActivitiesError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode)));
    } catch (e) {
      return left(ActivitiesError(errorMessage: e.toString()));
    }
  }

  Future<EitherMapOrActivitiesError> getActivitiesByStatus(
      {required String status}) async {
    try {
      final Map<String, dynamic> response =
          await activitiesProvider.getActivitiesByStatus(status: status);
      // final AllActivitiesModel model = AllActivitiesModel.fromJson(response);
      // return right(model);
      return right(response);
    } on DioException catch (e) {
      return left(ActivitiesError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode)));
    } catch (e) {
      return left(ActivitiesError(errorMessage: e.toString()));
    }
  }

  Future<EitherSingleActivityByIdModelOrActivitiesError> getActivitiesById(
      {required String id}) async {
    try {
      final Map<String, dynamic> response =
          await activitiesProvider.getActivityById(id: id);
      final model = SingleActivityByIdModel.fromJson(response);
      return right(model);
    } on DioException catch (e) {
      return left(ActivitiesError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode)));
    } catch (e) {
      return left(ActivitiesError(errorMessage: e.toString()));
    }
  }

  Future<EitherActivitiesCreatedModelOrActivitiesError> createActivity({
    required Map<String, dynamic> details,
  }) async {
    try {
      final response =
          await activitiesProvider.createActivity(details: details);
      logger.f(response);
      return right(ActivityCreationModel.fromJson(response));
    } on DioException catch (e) {
      logger.e(e.response?.statusCode);
      logger.e(e.toString());

      return left(
          ActivitiesError(errorMessage: e.response?.statusMessage ?? ""));
    } catch (e) {
      return left(ActivitiesError(errorMessage: e.toString()));
    }
  }
}
