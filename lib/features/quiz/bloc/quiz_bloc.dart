import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/quiz/data/models/quiz_error.dart';
import 'package:matchup/features/quiz/data/models/quiz_model.dart';
import 'package:matchup/features/quiz/data/repositories/quiz_repository.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final QuizRepository repo;
  QuizBloc({required this.repo}) : super(QuizInitial()) {
    on<QuizEventGetQuiz>((event, emit) async {
      emit(QuizStateIsLoading());
      final res = await repo.getQuiz();
      res.fold((l) => emit(QuizStateError(error: l)),
          (r) => emit(QuizStateQuizRetrieved(quiz: r)));
    });
  }
}
