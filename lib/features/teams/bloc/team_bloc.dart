// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/teams/data/models/team_error.dart';
import 'package:matchup/features/teams/data/repositories/team_repository.dart';

part 'team_event.dart';
part 'team_state.dart';

class TeamBloc extends Bloc<TeamEvent, TeamState> {
  final TeamRepository repo;
  TeamBloc({
    required this.repo,
  }) : super(TeamInitial()) {
    on<TeamEventCreateTeam>((event, emit) async {
      emit(TeamStateIsLoading());
      final res = await repo.updateUser(details: event.details);
      res.fold((l) => emit(TeamStateError(error: l)),
          (r) => emit(TeamStateTeamCreated(teamCreated: r)));
    });
  }
}
