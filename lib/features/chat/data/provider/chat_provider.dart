import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class ChatProvider {
  Future<Map<String, dynamic>> getChat({required String id}) async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.get(
        path: "${ApiRoutes.chat}/$id",
        options: Options(
          headers: {"Authorization": "Bearer ${user?.token ?? ""}"},
        ),
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> sendChat(
      {required String recieverId, required String message}) async {
    try {
      final AuthUser? user = await LocalDataSource().getUser();

      final response = DioClient.instance.post(
        data: {
          "receiver_id": recieverId,
          "message": message,
        },
        path: ApiRoutes.chat,
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
