// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'team_bloc.dart';

sealed class TeamState extends Equatable {
  const TeamState();

  @override
  List<Object> get props => [];
}

final class TeamInitial extends TeamState {}

class TeamStateIsLoading extends TeamState {}

class TeamStateTeamCreated extends TeamState {
  final Map<String, dynamic> teamCreated;
  const TeamStateTeamCreated({
    required this.teamCreated,
  });
}

class TeamStateError extends TeamState {
  final TeamError error;
  const TeamStateError({
    required this.error,
  });
}
