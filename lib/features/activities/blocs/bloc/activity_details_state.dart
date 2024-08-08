// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'activity_details_bloc.dart';

sealed class ActivityDetailsState extends Equatable {
  const ActivityDetailsState();

  @override
  List<Object> get props => [];
}

// class ActivityDetailsLoaded extends ActivityDetailsState {
//   List<Map<String, dynamic>> values;
//   ActivityDetailsLoaded({
//     required this.values,
//   });
// }

class ActivitiesInfoGathering extends ActivityDetailsState {
  final Map<String, dynamic> formDetails;

  const ActivitiesInfoGathering({
    required this.formDetails,
  });

  @override
  List<Object> get props => [formDetails];
}
