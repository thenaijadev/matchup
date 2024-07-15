import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
import 'package:matchup/features/profile/data/models/create_user_sport_model.dart';
import 'package:matchup/features/profile/data/models/profile_error_model.dart';
import 'package:matchup/features/profile/data/repositories/profile_repositories.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository repo;
  ProfileBloc({required this.repo}) : super(ProfileInitial()) {
    on<ProfileEventGetSports>((event, emit) async {
      emit(ProfileStateIsLoading());

      final response = await repo.getSports(authToken: event.authToken);
      response.fold((l) => emit(ProfileStateError(error: l)),
          (r) => emit(ProfileStateAllSportsGotten(sportsModel: r)));
    });
    on<ProfileEventCreateUserSport>((event, emit) async {
      emit(ProfileStateIsLoading());

      final response = await repo.createUserSports(
          authToken: event.authToken, sports: event.sports);
      response.fold((l) => emit(ProfileStateError(error: l)),
          (r) => emit(ProfileStateUserSportCreated(sportsModel: r)));
    });
  }
}
