// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reviews_bloc.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

final class ReviewsInitial extends ReviewsState {}

class ReviewsIsLoading extends ReviewsState {}

class ReviewsStateReviewsError extends ReviewsState {
  final ReviewsError error;
  const ReviewsStateReviewsError({
    required this.error,
  });
}

class ReviewsStateReviewsRetrieved extends ReviewsState {
  final ReviewsModel reviews;
  const ReviewsStateReviewsRetrieved({
    required this.reviews,
  });
}

class ReviewsStateReviewPost extends ReviewsState {
  final ReviewPostModel review;
  const ReviewsStateReviewPost({
    required this.review,
  });
}
