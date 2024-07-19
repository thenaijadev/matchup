import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class ReviewsProvider {
  Future<Map<String, dynamic>> getReviews({required String id}) async {
    try {
      final user = await LocalDataSource().getUser();
      final response = await DioClient.instance.get(
          path: "${ApiRoutes.getAllActivities}/$id/reviews",
          options: Options(
              headers: {"Authorization": "Bearer ${user?.token ?? ""}"}));
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
