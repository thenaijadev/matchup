// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/chat/data/models/participant_error.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';
import 'package:matchup/features/chat/data/repository/participant_repository.dart';

part 'participants_event.dart';
part 'participants_state.dart';

class ParticipantsBloc extends Bloc<ParticipantsEvent, ParticipantsState> {
  final ParticipantRepository repo;
  ParticipantsBloc({
    required this.repo,
  }) : super(ParticipantsInitial()) {
    on<ParticiantEventGetParticiants>((event, emit) async {
      emit(ParticipantStateIsLoading());
      final res = await repo.getParticipant();
      res.fold((l) => emit(ParticipantStateError(error: l)),
          (r) => emit(ParticipantStateParticipantsRetrieved(participants: r)));
    });
  }
}
