import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logger.e("Chat");
        Navigator.pushNamed(context, Routes.chat);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset(
              "assets/images/contact_image.png",
              width: 50,
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Mary Howard",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    TextWidget(
                      text: "How are you",
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                      text: "2:45am",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const CircleAvatar(
                      radius: 10,
                      child: TextWidget(
                        text: "2",
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
