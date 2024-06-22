import 'package:flutter/material.dart';
import 'package:matchup/features/home/presentation/widgets/chat_screen_widgets/chat_message_widget.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key, required this.messages});
  final List<Map<String, dynamic>> messages;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: List.generate(messages.length, (index) => const ChatMessage()),
    ));
  }
}
