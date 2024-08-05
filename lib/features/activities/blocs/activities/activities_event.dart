// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'activities_bloc.dart';

sealed class ActivitiesEvent extends Equatable {
  const ActivitiesEvent();

  @override
  List<Object> get props => [];
}

class ActivitiesEventGetAllActivities extends ActivitiesEvent {}

class ActivitiesEventGetAllActivitiesByStatus extends ActivitiesEvent {
  final String status;
  const ActivitiesEventGetAllActivitiesByStatus({
    required this.status,
  });
}

class ActivitiesEventGetAllActivitiesById extends ActivitiesEvent {
  final String id;
  const ActivitiesEventGetAllActivitiesById({
    required this.id,
  });
}

class ActivityEventCreateActivity extends ActivitiesEvent {
  const ActivityEventCreateActivity();
}

class ActivityEventGatherInfoEvent extends ActivitiesEvent {
  final Map<String, dynamic> keyValue;
  const ActivityEventGatherInfoEvent({
    required this.keyValue,
  });
}
