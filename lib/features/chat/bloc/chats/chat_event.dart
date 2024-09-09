// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chat_bloc.dart';

sealed class ChatEvent extends Equatable {
  const ChatEvent();

  @override
  List<Object> get props => [];
}

class ChatEventGetChat extends ChatEvent {
  final String id;
  const ChatEventGetChat({
    required this.id,
  });
}

class ChatEventPostChat extends ChatEvent {
  final String recieverId;
  final String message;
  const ChatEventPostChat({
    required this.recieverId,
    required this.message,
  });
}
