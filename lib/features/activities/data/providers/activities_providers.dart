import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class ActivitiesProvider {
  Future<Map<String, dynamic>> getActivities() async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.get(
        path: ApiRoutes.getAllActivities,
        options: Options(
          headers: {"Authorization": "Bearer ${user?.token ?? ""}"},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createActivity({
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
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.post(
        data: {
          'name': name,
          'description': description,
          'sport_id': sportId,
          'allowed_genders': allowedGenders,
          'frequency': frequency,
          'start_time': startTime,
          'end_time': endTime,
          'start_date': startDate,
          'location_name': locationName,
          'address': address,
          'long_lat': '{"latitude": $lat, "longitude": $long}',
          'participant_fee': participantFee,
          'fee': fee,
          'level': level,
          'completed': completed,
          'cancelled_at':
              cancelledAt, // Or an appropriate value if cancelled  can be null
          'type': type
        },
        path: ApiRoutes.getAllActivities,
        options: Options(
          headers: {"Authorization": "Bearer ${user?.token ?? ""}"},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getActivitiesByStatus(
      {required String status}) async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.get(
        path: "${ApiRoutes.getAllActivities}/$status",
        options: Options(
          headers: {"Authorization": "Bearer ${user?.token ?? ""}"},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getActivityById({required String id}) async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.get(
        path: "${ApiRoutes.getAllActivities}/$id",
        options: Options(
          headers: {"Authorization": "Bearer ${user?.token ?? ""}"},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
