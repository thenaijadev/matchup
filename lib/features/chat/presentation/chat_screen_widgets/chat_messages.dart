import 'package:flutter/material.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/chat_message_widget.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, required this.participants});
  final List<Participants> participants;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: List.generate(participants.length,
          (index) => ChatMessage(participant: participants[index])),
    ));
  }
}
