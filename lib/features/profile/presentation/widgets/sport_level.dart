import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';

class SportLevelWidget extends StatefulWidget {
  const SportLevelWidget(
      {super.key,
      required this.sports,
      required this.index,
      required this.moveSport});
  final List<Sport> sports;
  final int index;
  final Function(List<Sport>, bool) moveSport;
  @override
  State<SportLevelWidget> createState() => _SportLevelWidgetState();
}

class _SportLevelWidgetState extends State<SportLevelWidget> {
  List<Map<String, dynamic>> emojis = [
    {"name": "Terrible", "image": "😥"},
    {"name": "Bad", "image": "☹️"},
    {"name": "Okay", "image": "🙂"},
    {"name": "Good", "image": "😎"},
    {"name": "Amazing", "image": "🤗"},
  ];
  List<String> levels = [
    "Professional",
    "Competitive",
    "Casual",
    "Just for fun"
  ];
  bool isComplete = true;
  int _selectedIndex = -1;
  late ExpansionTileController controller;
  List<Sport> updatedSports = [];
  @override
  void initState() {
    updatedSports = widget.sports;

    controller = ExpansionTileController();
    super.initState();
  }

  String? levelTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: Theme.of(context).colorScheme.secondary),
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(22, 254, 94, 8),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.primary)),
                height: 50,
                width: 50,
                child: Image.asset(widget.sports[widget.index].image!),
              ),
              const SizedBox(
                width: 10,
              ),
              TextWidget(
                fontSize: 12,
                text: widget.sports[widget.index].name ?? "",
                color: Theme.of(context).colorScheme.inversePrimary,
                fontWeight: FontWeight.bold,
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              emojis.length,
              (emojiIndex) => Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = emojiIndex;
                        updatedSports[widget.index] = widget
                            .sports[widget.index]
                            .copyWith(skillLevel: emojis[emojiIndex]["name"]);

                        widget.moveSport(updatedSports, isComplete);
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: _selectedIndex == emojiIndex
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.inverseSurface),
                        color: _selectedIndex == emojiIndex
                            ? const Color.fromARGB(22, 254, 94, 8)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: TextWidget(
                          text: emojis[emojiIndex]["image"]!,
                          fontSize: 25,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextWidget(
                    fontWeight: FontWeight.bold,
                    text: emojis[emojiIndex]["name"]!,
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1, color: Theme.of(context).colorScheme.secondary),
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionTile(
              controller: controller,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              collapsedIconColor: Theme.of(context).colorScheme.secondary,
              title: TextWidget(
                text: levelTitle ?? "Tell us your Experience Level",
                color: Theme.of(context).colorScheme.secondary,
              ),
              children: List.generate(
                  levels.length,
                  (index) => Container(
                        padding: const EdgeInsets.only(left: 20),
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextWidget(
                            onTap: () {
                              controller.collapse();
                              setState(() {
                                levelTitle = levels[index];
                                updatedSports[widget.index] = widget
                                    .sports[widget.index]
                                    .copyWith(experienceLevel: levels[index]);
                                for (var element in updatedSports) {}
                                widget.moveSport(updatedSports, isComplete);
                              });
                            },
                            text: levels[index],
                            color: Theme.of(context).colorScheme.secondary,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }
}
