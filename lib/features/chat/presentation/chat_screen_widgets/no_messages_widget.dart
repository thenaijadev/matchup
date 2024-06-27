import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class NoMessagesWidget extends StatelessWidget {
  const NoMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/no_messages_icon.png",
          width: 150,
        ),
        const SizedBox(
          height: 10,
        ),
        TextWidget(
          text: "No messages yet!",
          fontSize: 18,
          color: Theme.of(context).colorScheme.secondary,
        )
      ],
    ));
  }
}
