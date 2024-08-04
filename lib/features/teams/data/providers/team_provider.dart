import 'package:dio/dio.dart';
import 'package:matchup/core/network/api_endpoint.dart';
import 'package:matchup/core/network/dio_client.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';

class TeamProvider {
  Future<Map<String, dynamic>> createTeam({
    required Map<String, dynamic> details,
  }) async {
    final pickedFile = details["badge"];
    final formDetails = {
      ...details,
      "members": [1, 2],
      "badge": await MultipartFile.fromFile(
        pickedFile?.path ?? "",
        filename: pickedFile?.path.split('/').last,
      ),
    };
    final formData = FormData.fromMap(formDetails);
    logger.e(formDetails);
    try {
      final user = await LocalDataSource().getUser();
      logger.e(user?.token);
      final response = await DioClient.instance.post(
          path: ApiRoutes.createTeam,
          data: formData,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": "Bearer ${user?.token}"
            },
          ));
      logger.i(response);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
