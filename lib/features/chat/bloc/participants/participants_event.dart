part of 'participants_bloc.dart';

sealed class ParticipantsEvent extends Equatable {
  const ParticipantsEvent();

  @override
  List<Object> get props => [];
}

class ParticiantEventGetParticiants extends ParticipantsEvent {}
