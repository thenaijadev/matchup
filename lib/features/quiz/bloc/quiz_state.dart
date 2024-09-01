// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quiz_bloc.dart';

sealed class QuizState extends Equatable {
  const QuizState();

  @override
  List<Object> get props => [];
}

final class QuizInitial extends QuizState {}

class QuizStateIsLoading extends QuizState {}

class QuizStateError extends QuizState {
  final QuizError error;
  const QuizStateError({
    required this.error,
  });
}

class QuizStateQuizRetrieved extends QuizState {
  final QuizModel quiz;
  const QuizStateQuizRetrieved({
    required this.quiz,
  });
}
