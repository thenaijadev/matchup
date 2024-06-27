import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/chats_widget.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/no_contact_witdet.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({
    super.key,
    required this.changePage,
  });
  final VoidCallback changePage;

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  List<Map<String, dynamic>> contacts = [{}];
  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? NoContactWidget(changePage: widget.changePage)
        : const ChatsWidget();
  }
}
