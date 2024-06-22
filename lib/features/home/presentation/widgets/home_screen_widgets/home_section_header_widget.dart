import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class HomeWidgetHeaderSection extends StatelessWidget {
  const HomeWidgetHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(child: Icon(Icons.person)),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Good Morning",
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                TextWidget(
                  text: "Okwor Chukwuemeka",
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: const Color(0xff282828), width: 2),
              ),
              child: Image.asset(
                width: 50,
                "assets/images/search.png",
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: const Color(0xff282828), width: 2),
              ),
              child: Image.asset(
                width: 50,
                "assets/images/bell.png",
              ),
            ),
          ],
        )
      ],
    );
  }
}
