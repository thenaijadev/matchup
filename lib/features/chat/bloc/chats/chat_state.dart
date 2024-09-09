// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class ChatStateIsLoading extends ChatState {}

class ChatStateError extends ChatState {
  final ChatError error;
  const ChatStateError({
    required this.error,
  });
}

class ChatStateChatsRecieved extends ChatState {
  final ChatModel chats;
  const ChatStateChatsRecieved({
    required this.chats,
  });
}

class ChatStateMessageSent extends ChatState {
  final SentChatModel sentChatModel;
  const ChatStateMessageSent({
    required this.sentChatModel,
  });
}
