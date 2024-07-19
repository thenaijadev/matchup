// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/activities/data/models/reviews/reviews_error.dart';
import 'package:matchup/features/activities/data/models/reviews/reviews_model.dart';
import 'package:matchup/features/activities/data/providers/reviews_provider.dart';

class ReviewsRepository {
  final ReviewsProvider provider;
  ReviewsRepository({
    required this.provider,
  });
  Future<EitherReviewsErrorOrReviewsModel> getReviews(
      {required String activityId}) async {
    try {
      final response = await provider.getReviews(id: activityId);
      return right(ReviewsModel.fromJson(response));
    } on DioException catch (e) {
      return left(ReviewsError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode)));
    } catch (e) {
      return left(ReviewsError(errorMessage: e.toString()));
    }
  }
}
