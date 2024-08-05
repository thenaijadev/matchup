// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
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
      final AllActivitiesModel model = AllActivitiesModel.fromJson(response);
      return right(model);
    } on DioException catch (e) {
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
    required String type,
    required String cancelledAt,
    required String completed,
    required String level,
    required String fee,
    required String participantFee,
    required String long,
    required String lat,
    required String address,
    required String locationName,
    required String startDate,
    required String endTime,
    required String name,
    required String description,
    required String sportId,
    required String allowedGenders,
    required String frequency,
    required String startTime,
  }) async {
    try {
      final response = await activitiesProvider.createActivity(
          type: type,
          cancelledAt: cancelledAt,
          completed: completed,
          level: level,
          fee: fee,
          participantFee: participantFee,
          long: long,
          lat: lat,
          name: name,
          description: description,
          sportId: sportId,
          allowedGenders: allowedGenders,
          frequency: frequency,
          startTime: startTime,
          address: address,
          locationName: locationName,
          startDate: startDate,
          endTime: endTime);

      return right(ActivityCreationModel.fromJson(response));
    } on DioException catch (e) {
      return left(
          ActivitiesError(errorMessage: e.response?.statusMessage ?? ""));
    } catch (e) {
      return left(ActivitiesError(errorMessage: e.toString()));
    }
  }
}
