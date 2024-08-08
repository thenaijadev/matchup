part of 'activity_details_bloc.dart';

sealed class ActivityDetailsEvent extends Equatable {
  const ActivityDetailsEvent();

  @override
  List<Object> get props => [];
}

class ActivityEventGatherInfoEvent extends ActivityDetailsEvent {
  final Map<String, dynamic> keyValue;
  const ActivityEventGatherInfoEvent({
    required this.keyValue,
  });
}
