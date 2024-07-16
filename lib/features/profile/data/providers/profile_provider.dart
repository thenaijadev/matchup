import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/core/utils/logger.dart';

class ProfileProvider {
  Future<Map<String, dynamic>> getSports({required String authToken}) async {
    try {
      final response = await DioClient.instance.get(
          path: ApiRoutes.getAllSports,
          options: Options(
            headers: {"Authorization": "Bearer $authToken"},
          ));
      logger.e(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> createUserSports(
      {required String authToken,
      required List<Map<String, dynamic>> sports}) async {
    try {
      final response = await DioClient.instance.post(
          data: {"sports": sports},
          path: ApiRoutes.userSports,
          options: Options(
            headers: {"Authorization": "Bearer $authToken"},
          ));
      logger.e(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> getUser({
    required String authToken,
  }) async {
    try {
      final response = await DioClient.instance.get(
          path: ApiRoutes.userSports,
          options: Options(
            headers: {"Authorization": "Bearer $authToken"},
          ));
      logger.e(response);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
