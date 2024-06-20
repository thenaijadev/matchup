import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/profile/presentation/widgets/sport_level.dart';

class ChooseSportLevelScreen extends StatefulWidget {
  const ChooseSportLevelScreen({super.key, required this.sports});
  final List<Map<String, String>> sports;

  @override
  State<ChooseSportLevelScreen> createState() => _ChooseSportLevelScreenState();
}

class _ChooseSportLevelScreenState extends State<ChooseSportLevelScreen> {
  List<Map<String, dynamic>> emojis = [
    {"name": "Terrible", "image": "😥"},
    {"name": "Bad", "image": "☹️"},
    {"name": "Okay", "image": "🙂"},
    {"name": "Good", "image": "😎"},
    {"name": "Amazing", "image": "🤗"},
  ];
  final int _selectedIndex1 = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0)
              .copyWith(bottom: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(),
                child: TextWidget(
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    text:
                        "How well will you rate your skills on each of the sport."),
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                      widget.sports.length,
                      (index) => SportLevelWidget(
                            index: index,
                            sports: [...widget.sports],
                          )),
                ),
              ),
              PrimaryButton(label: "Save", onPressed: () {}, isEnabled: true),
            ],
          ),
        ),
      ),
    );
  }
}
