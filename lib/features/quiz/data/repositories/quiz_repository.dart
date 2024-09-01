// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/quiz/data/models/quiz_error.dart';
import 'package:matchup/features/quiz/data/models/quiz_model.dart';
import 'package:matchup/features/quiz/data/providers/quiz_provider.dart';

class QuizRepository {
  final QuizProvider provider;
  QuizRepository({
    required this.provider,
  });
  Future<EitherQuizErrorOrQuizModel> getQuiz() async {
    try {
      final res = await provider.getQuiz();
      return right(QuizModel.fromJson(res));
    } on DioException catch (e) {
      logger.e(e.toString());
      return left(QuizError(message: e.response?.statusMessage ?? ""));
    } catch (e) {
      return left(QuizError(message: e.toString()));
    }
  }
}
