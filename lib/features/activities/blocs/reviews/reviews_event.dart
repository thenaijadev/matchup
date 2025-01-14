// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'reviews_bloc.dart';

sealed class ReviewsEvent extends Equatable {
  const ReviewsEvent();

  @override
  List<Object> get props => [];
}

class ReviewsEventGetReviews extends ReviewsEvent {
  final String activityId;
  const ReviewsEventGetReviews({
    required this.activityId,
  });
}

class ReviewEventPostReview extends ReviewsEvent {
  final String activityId;

  final String comment;
  final String rating;
  const ReviewEventPostReview({
    required this.activityId,
    required this.comment,
    required this.rating,
  });
}
