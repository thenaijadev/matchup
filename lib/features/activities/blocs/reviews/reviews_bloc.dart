import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/activities/data/models/reviews/review_post_model.dart';
import 'package:matchup/features/activities/data/models/reviews/reviews_error.dart';
import 'package:matchup/features/activities/data/models/reviews/reviews_model.dart';
import 'package:matchup/features/activities/data/repositories/reviews_repository.dart';

part 'reviews_event.dart';
part 'reviews_state.dart';

class ReviewsBloc extends Bloc<ReviewsEvent, ReviewsState> {
  final ReviewsRepository repo;
  ReviewsBloc({required this.repo}) : super(ReviewsInitial()) {
    on<ReviewsEventGetReviews>((event, emit) async {
      emit(ReviewsIsLoading());
      final response = await repo.getReviews(activityId: event.activityId);
      response.fold((l) => emit(ReviewsStateReviewsError(error: l)),
          (r) => emit(ReviewsStateReviewsRetrieved(reviews: r)));
    });

    on<ReviewEventPostReview>((event, emit) async {
      emit(ReviewsIsLoading());

      final response = await repo.postReview(
          activityID: event.activityId,
          comment: event.comment,
          rating: event.rating);
      response.fold((l) => emit(ReviewsStateReviewsError(error: l)),
          (r) => emit(ReviewsStateReviewPost(review: r)));
    });
  }
}
