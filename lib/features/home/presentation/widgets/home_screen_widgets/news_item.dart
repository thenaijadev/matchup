import 'package:flutter/material.dart';
import 'package:matchup/core/utils/app_constraints.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({
    super.key,
    required this.isFirst,
  });
  final bool isFirst;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          "assets/images/cnn.png",
                        )),
                    borderRadius: BorderRadius.circular(100),
                    border:
                        Border.all(color: const Color(0xff282828), width: 2),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                TextWidget(
                  text: "CNN News",
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  width: 15,
                ),
                TextWidget(
                  text: "2 hours ago",
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.secondary,
                )
              ],
            ),
            if (isFirst) const TextWidget(text: "Read More")
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 230.width,
              child: TextWidget(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  text:
                      "Nikola Jokic: Denver Nuggets star named NBA's Most Valuable Player (MVP) for third time in four years"),
            ),
            Image.asset(
              "assets/images/news_item.png",
              width: 100.width,
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
