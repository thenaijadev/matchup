import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/places/data/models/places_error.dart';
import 'package:matchup/features/places/data/models/places_success.dart';
import 'package:matchup/features/places/data/repositories/places_repository.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final PlacesRepository repository;
  PlacesBloc({required this.repository}) : super(PlacesInitial()) {
    on<PlacesEventGetSuggestions>((event, emit) async {
      emit(PlacesStateIsLoading());
      final res = await repository.getPlaces(query: event.query);
      res.fold((l) {
        emit(PlacesStateError(errorMessage: l));
      }, (r) {
        emit(PlacesStateSuccess(places: r));
      });
    });
  }
}
