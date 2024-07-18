// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'activities_bloc.dart';

sealed class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object> get props => [];
}

final class ActivitiesInitial extends ActivitiesState {}

class ActivitiesStateIsLoading extends ActivitiesState {}

class ActivitiesStateError extends ActivitiesState {
  final ActivitiesError error;

  const ActivitiesStateError({
    required this.error,
  });
}

class ActivitiesStateAllActivitiesRetreived extends ActivitiesState {
  final AllActivitiesModel activitiesModel;
  const ActivitiesStateAllActivitiesRetreived({
    required this.activitiesModel,
  });
}

class ActivitiesStateAllActivitiesRetreivedByStatus extends ActivitiesState {
  final Map<String, dynamic> activities;
  const ActivitiesStateAllActivitiesRetreivedByStatus({
    required this.activities,
  });
}

class ActivitiesStateAllActivitiesRetreivedById extends ActivitiesState {
  final SingleActivityByIdModel activity;
  const ActivitiesStateAllActivitiesRetreivedById({
    required this.activity,
  });
}
