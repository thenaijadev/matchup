import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/profile/presentation/widgets/sport_time_widget.dart';

class SportChoiceScreen extends StatefulWidget {
  const SportChoiceScreen({super.key});

  @override
  State<SportChoiceScreen> createState() => _SportChoiceScreenState();
}

class _SportChoiceScreenState extends State<SportChoiceScreen> {
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

  final List<Map<String, String>> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: Transform.translate(
          offset: const Offset(15, 0),
          child: Transform.scale(
            scale: 0.7,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: const Color(0xff282828), width: 2),
                ),
                child: Image.asset(
                  "assets/images/arrow_back_dark.png",
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "Choose your sport",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
              ),
              child: TextWidget(
                  textAlign: TextAlign.center,
                  color: Theme.of(context).colorScheme.secondary,
                  text:
                      "You can select more than one of your favourite sport."),
            ),
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3, // Number of items in each row
              childAspectRatio: 1, // Aspect ratio of each item
              mainAxisSpacing: 10.0, // Spacing between rows
              crossAxisSpacing: 10.0, // Spacing between items
              children: List.generate(
                items.length,
                (index) => SportItemWidget(
                  isSelected: selectedItems.contains(items[index]),
                  onTap: () {
                    setState(() {
                      if (selectedItems.length >= 5) {
                        if (selectedItems.contains(items[index])) {
                          selectedItems.remove(items[index]);
                        }
                      } else {
                        if (selectedItems.contains(items[index])) {
                          selectedItems.remove(items[index]);
                        } else {
                          selectedItems.add(items[index]);
                        }
                      }
                    });
                  },
                  image: items[index]["image"]!,
                  title: items[index]["title"]!,
                  chosenIndex: index,
                ),
              ),
            ),
            const Spacer(),
            const Spacer(),
            TextWidget(
              text: "${selectedItems.length} of 5",
              fontSize: 16,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const Spacer(),
            Opacity(
                opacity: selectedItems.isEmpty ? 0.5 : 1,
                child: PrimaryButton(
                    label: "Save",
                    onPressed: () {
                      if (selectedItems.isNotEmpty) {
                        Navigator.pushNamed(context, Routes.chooseSportLevel,
                            arguments: selectedItems);
                      }
                    },
                    isEnabled: true)),
          ],
        ),
      ),
    );
  }
}
