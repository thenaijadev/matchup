import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class TeamProvider {
  Future<Map<String, dynamic>> createTeam({
    required Map<String, dynamic> details,
  }) async {
    final formData = FormData.fromMap(details);

    try {
      final user = await LocalDataSource().getUser();
      final response = await DioClient.instance.post(
          path: ApiRoutes.updateProfile,
          data: formData,
          options: Options(
            headers: {"Authorization": "Bearer ${user?.token}"},
          ));

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
