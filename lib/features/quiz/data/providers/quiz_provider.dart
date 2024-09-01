import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class QuizProvider {
  Future<Map<String, dynamic>> getQuiz() async {
    final user = await LocalDataSource().getUser();

    try {
      final response = await DioClient.instance.get(
          //TODO :Token
          path: ApiRoutes.quiz,
          options: Options(
            headers: {
              "Authorization":
                  "Bearer 245|zYJU8qUuBvRU7OVl8VGBQK1bas6268Oos40aUwPD58ef37d6"
            },
          ));

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
