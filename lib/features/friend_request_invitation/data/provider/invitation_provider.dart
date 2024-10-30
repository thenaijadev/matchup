import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';

class InvitationProvider {
  Future<Map<String, dynamic>> getPendingRequests() async {
    try {
      final res = await DioClient.instance.get(
          options: Options(headers: {}),
          path: ApiRoutes.getAllSports,
          queryParameters: {"status": "PENDING"});
      return res;
    } catch (e) {
      rethrow;
    }
  }
}
