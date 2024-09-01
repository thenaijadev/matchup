import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class ActivitiesProvider {
  Future<Map<String, dynamic>> getActivities() async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = await DioClient.instance.get(
        path: ApiRoutes.getAllActivities,
        options: Options(
          headers: {"Authorization": "Bearer ${user?.token ?? ""}"},
        ),
      );
      logger.d(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Future<Map<String, dynamic>> createActivity({
  //   required Map<String, dynamic> details,
  // }) async {
  //   try {
  //     final AuthUser? user = await LocalDataSource().getUser();
  //     final data = FormData.fromMap({...details});
  //     final response = await DioClient.instance.post(
  //       data: data,
  //       path: "/api/activities",
  //       options: Options(
  //         headers: {
  //           "Authorization": "Bearer ${user?.token ?? ""}",
  //         },
  //       ),
  //     );
  //     logger.f({"fromAc": response});
  //     return response;
  //   } catch (e) {
  //     logger.d(e.toString());
  //     rethrow;
  //   }
  // }

  Future<Map<String, dynamic>> createActivity(
      {required Map<String, dynamic> details}) async {
    final formData = FormData.fromMap({...details});
    final authToken = await LocalDataSource().getUser();
    final token = authToken?.token;
    try {
      final response = await DioClient.instance.post(
          path: ApiRoutes.getAllActivities,
          data: formData,
          options: Options(
            headers: {"Authorization": "Bearer $token"},
          ));

      return response;
    } catch (e) {
      logger.e(e.toString());
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
