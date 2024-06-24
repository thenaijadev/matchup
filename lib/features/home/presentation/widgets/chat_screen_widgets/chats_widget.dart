import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/home/presentation/widgets/chat_screen_widgets/chat_messages.dart';
import 'package:matchup/features/home/presentation/widgets/chat_screen_widgets/no_messages_widget.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> messages = [
      {},
      {},
      {},
      {},
      {},
      {},
      {},
      {},
      {},
      {},
      {},
    ];
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border:
                          Border.all(color: const Color(0xff282828), width: 2),
                    ),
                    child: Image.asset(
                      "assets/images/arrow_back_dark.png",
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                TextWidget(
                  text: "Chats",
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
            GestureDetector(
              child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(color: const Color(0xff282828), width: 2),
                  ),
                  child: const Center(child: Icon(Icons.more_vert_outlined))),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        InputFieldWidget(
            prefixicon: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            hintColor: Theme.of(context).colorScheme.secondary,
            hintText: "Search for friends....",
            onChanged: (val) {}),
        const SizedBox(
          height: 20,
        ),
        if (messages.isEmpty) const NoMessagesWidget(),
        if (messages.isNotEmpty) ChatMessages(messages: messages),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
