// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/chat/data/models/participant_error.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';
import 'package:matchup/features/chat/data/provider/participants_provider.dart';

class ParticipantRepository {
  final ParticipantsProvider provider;
  ParticipantRepository({
    required this.provider,
  });

  Future<EitherParticipantErrorOrParticipantModel> getParticipant() async {
    try {
      final res = await provider.getParticipants();
      logger.f(res);
      return right(ParticipantsModel.fromJson(res));
    } on DioException catch (e) {
      logger.e(e.response ?? "");

      return left(ParticipantError(message: e.response?.statusMessage ?? ""));
    } catch (e) {
      logger.e(e);

      return left(ParticipantError(message: e.toString()));
    }
  }
}
