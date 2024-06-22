import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/home/presentation/widgets/news_item.dart';

class NewsSectionWidget extends StatefulWidget {
  const NewsSectionWidget({super.key});

  @override
  State<NewsSectionWidget> createState() => _NewsSectionWidgetState();
}

class _NewsSectionWidgetState extends State<NewsSectionWidget> {
  int _chosenIndex = 0;
  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> items = [
      {"title": "Basketball", "image": "assets/images/basket_ball.png"},
      {"title": "Rugby", "image": "assets/images/rugby.png"},
      {"title": "Tennis", "image": "assets/images/tennis.png"},
      {"title": "Football", "image": "assets/images/football.png"},
      {"title": "Baseball", "image": "assets/images/baseball.png"},
      {"title": "Ice Hokey", "image": "assets/images/hockey.png"},
      {"title": "Table Tennis", "image": "assets/images/table_tennis.png"},
      {"title": "Cricket", "image": "assets/images/cricket.png"},
      {"title": "Soccer", "image": "assets/images/soccer.png"},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: "Sport news",
          color: Theme.of(context).colorScheme.inversePrimary,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        TextWidget(
          text: "The hottest news and views from the world of sports.",
          color: Theme.of(context).colorScheme.secondary,
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 35,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              items.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    _chosenIndex = index;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        width: 2,
                        color: _chosenIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : const Color(0xff282828)),
                  ),
                  child: Center(
                      child: TextWidget(
                    text: items[index]["title"]!,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          height: 184,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/news_headline.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        TextWidget(
            color: Theme.of(context).colorScheme.inversePrimary,
            text:
                "Mauricio Pochettino : “Chealsea FC can confirm that the club and mauricio pochettino have mutually agreed to part ways, “Chealsea said in a statement."),
        const SizedBox(
          height: 20,
        ),
        ...List.generate(
          3,
          (index) => NewsItemWidget(
            isFirst: index == 0,
          ),
        ),
      ],
    );
  }
}
