// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'places_bloc.dart';

sealed class PlacesEvent extends Equatable {
  const PlacesEvent();

  @override
  List<Object> get props => [];
}

class PlacesEventGetSuggestions extends PlacesEvent {
  final String query;
  const PlacesEventGetSuggestions({
    required this.query,
  });
}
