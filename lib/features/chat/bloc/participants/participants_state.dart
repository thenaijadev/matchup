// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'participants_bloc.dart';

sealed class ParticipantsState extends Equatable {
  const ParticipantsState();

  @override
  List<Object> get props => [];
}

final class ParticipantsInitial extends ParticipantsState {}

class ParticipantStateIsLoading extends ParticipantsState {}

class ParticipantStateError extends ParticipantsState {
  final ParticipantError error;
  const ParticipantStateError({
    required this.error,
  });
}

class ParticipantStateParticipantsRetrieved extends ParticipantsState {
  final ParticipantsModel participants;
  const ParticipantStateParticipantsRetrieved({
    required this.participants,
  });
}
