// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchup/features/chat/data/models/message_error.dart';
import 'package:matchup/features/chat/data/repository/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final ChatRepository repo;
  ChatBloc({
    required this.repo,
  }) : super(ChatInitial()) {
    on<ChatEventGetChat>((event, emit) {
      // TODO: implement event handler
    });
  }
}
