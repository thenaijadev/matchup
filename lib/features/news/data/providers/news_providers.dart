import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class NewsProvider {
  Future<Map<String, dynamic>> getNews() async {
    final user = await LocalDataSource().getUser();

    try {
      final response = await DioClient.instance.get(
          path: ApiRoutes.getNews,
          options: Options(
            headers: {"Authorization": "Bearer ${user?.token}"},
          ));

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
