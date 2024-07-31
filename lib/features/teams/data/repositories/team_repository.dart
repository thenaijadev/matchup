// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/teams/data/models/team_error.dart';
import 'package:matchup/features/teams/data/providers/team_provider.dart';

class TeamRepository {
  final TeamProvider provider;
  TeamRepository({
    required this.provider,
  });

  Future<EitherTeamMapOrTeamError> updateUser({
    required Map<String, dynamic> details,
  }) async {
    try {
      final response = await provider.createTeam(details: details);

      return (right(response));
    } on DioException catch (e) {
      logger.f(e.response?.statusCode);

      return left(
        TeamError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode),
        ),
      );
    } catch (e) {
      return left(
        TeamError(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
