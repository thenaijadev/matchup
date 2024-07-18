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
}
