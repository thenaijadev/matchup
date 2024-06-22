import 'package:flutter/material.dart';
import 'package:matchup/features/home/presentation/widgets/chat_screen_widgets/contact_list_widget.dart';
import 'package:matchup/features/home/presentation/widgets/chat_screen_widgets/invite_friends_widget.dart';

class ChatScreenWidget extends StatefulWidget {
  const ChatScreenWidget({super.key});

  @override
  State<ChatScreenWidget> createState() => _ChatScreenWidgetState();
}

class _ChatScreenWidgetState extends State<ChatScreenWidget> {
  List<Map<String, dynamic>> contacts = [];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: [
        ContactListWidget(
          changePage: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
        InviteFriendsWidget(
          changePage: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        )
      ][selectedIndex],
    );
  }
}
