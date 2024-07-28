// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'team_bloc.dart';

sealed class TeamEvent extends Equatable {
  const TeamEvent();

  @override
  List<Object> get props => [];
}

class TeamEventCreateTeam extends TeamEvent {
  final Map<String, dynamic> details;
  const TeamEventCreateTeam({
    required this.details,
  });
}
