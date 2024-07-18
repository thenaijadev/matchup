// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:matchup/core/network/dio_exception.dart';
import 'package:matchup/core/utils/typedef.dart';
import 'package:matchup/features/news/data/models/news_error.dart';
import 'package:matchup/features/news/data/models/news_model.dart';
import 'package:matchup/features/news/data/models/sport_news_model.dart';
import 'package:matchup/features/news/data/providers/news_providers.dart';

class NewsRepository {
  final NewsProvider newsProvider;
  NewsRepository({
    required this.newsProvider,
  });
  Future<EitherNewsModelOrNewsError> getNews() async {
    try {
      final response = await newsProvider.getNews();

      return right(NewsModel.fromJson(response));
    } on DioException catch (e) {
      return left(NewsError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode)));
    } catch (e) {
      return left(NewsError(errorMessage: e.toString()));
    }
  }

  Future<EitherSportNewsModelOrNewsError> getNewsBySport(
      {required String sport}) async {
    try {
      final response = await newsProvider.getNewsBySport(sport: sport);

      return right(SportsNewsModel.fromJson(response));
    } on DioException catch (e) {
      return left(NewsError(
          errorMessage:
              DioExceptionClass.handleStatusCode(e.response?.statusCode)));
    } catch (e) {
      return left(NewsError(errorMessage: e.toString()));
    }
  }
}
