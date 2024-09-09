import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class ParticipantsProvider {
  Future<Map<String, dynamic>> getParticipants() async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.get(
        path: ApiRoutes.participants,
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
