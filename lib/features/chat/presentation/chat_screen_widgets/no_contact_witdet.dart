import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class NoContactWidget extends StatelessWidget {
  const NoContactWidget({
    super.key,
    required this.changePage,
  });

  final VoidCallback changePage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Column(
          children: [
            Image.asset(
              "assets/images/note_pad.png",
              width: 155,
            ),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "You have no contacts yet!",
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              text: "Invite friends from your contacts to join Sportspeaks",
              textAlign: TextAlign.center,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            )
          ],
        ),
        const Spacer(),
        PrimaryButton(
            label: "Invite a friend", onPressed: changePage, isEnabled: true),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
