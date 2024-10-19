// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'places_bloc.dart';

sealed class PlacesState extends Equatable {
  const PlacesState();

  @override
  List<Object> get props => [];
}

final class PlacesInitial extends PlacesState {}

class PlacesStateSuccess extends PlacesState {
  final PlacesSuccess places;
  const PlacesStateSuccess({
    required this.places,
  });
  @override
  List<Object> get props => [places];
}

class PlacesStateError extends PlacesState {
  final PlacesError errorMessage;
  const PlacesStateError({
    required this.errorMessage,
  });
}

class PlacesStateIsLoading extends PlacesState {}
