// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

sealed class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

final class NewsInitial extends NewsState {}

class NewsStateIsLoading extends NewsState {}

class NewsStateNewsError extends NewsState {
  final NewsError error;
  const NewsStateNewsError({
    required this.error,
  });
}

class NewsStateNewsRetrieved extends NewsState {
  final NewsModel news;
  const NewsStateNewsRetrieved({
    required this.news,
  });
}
