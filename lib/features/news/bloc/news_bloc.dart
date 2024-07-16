import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/news/data/models/news_error.dart';
import 'package:matchup/features/news/data/models/news_model.dart';
import 'package:matchup/features/news/data/repositories/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repo;
  NewsBloc({required this.repo}) : super(NewsInitial()) {
    on<NewsEventGetNews>((event, emit) async {
      emit(NewsStateIsLoading());
      final response = await repo.getNews();
      response.fold((l) => emit(NewsStateNewsError(error: l)),
          (r) => emit(NewsStateNewsRetrieved(news: r)));
    });
  }
}
