import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/profile/presentation/widgets/sport_time_widget.dart';

class CreateActivity extends StatefulWidget {
  const CreateActivity({
    super.key,
  });

  @override
  State<CreateActivity> createState() => _CreateActivityState();
}

class _CreateActivityState extends State<CreateActivity> {
  late ExpansionTileController _eventController;
  late ExpansionTileController _genderController;

  @override
  void initState() {
    _eventController = ExpansionTileController();
    _genderController = ExpansionTileController();

    super.initState();
  }

  String? eventType;
  String? gender;

  List<String> eventTypes = ["Games", "Exercises", "Just for fun"];
  List<String> genders = ["Males", "Females", "Mixed"];

  final List<Map<String, String>> items = [
    {"title": "Basketball", "image": "assets/images/basket_ball.png"},
    {"title": "Rugby", "image": "assets/images/rugby.png"},
    {"title": "Tennis", "image": "assets/images/tennis.png"},
    {"title": "Football", "image": "assets/images/football.png"},
    {"title": "Baseball", "image": "assets/images/baseball.png"},
    {"title": "Ice Hokey", "image": "assets/images/hockey.png"},
  ];

  final List<Map<String, String>> selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.secondary),
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpansionTile(
            controller: _eventController,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            collapsedIconColor: Theme.of(context).colorScheme.secondary,
            title: TextWidget(
              text: eventType ?? "Event type",
              color: Theme.of(context).colorScheme.secondary,
            ),
            children: List.generate(
                eventTypes.length,
                (index) => Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextWidget(
                          onTap: () {
                            _eventController.collapse();
                            setState(() {
                              eventType = eventTypes[index];
                            });
                          },
                          text: eventTypes[index],
                          color: Theme.of(context).colorScheme.secondary,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                    textAlign: TextAlign.center,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                    text: "Choose an activity"),
                TextWidget(
                    textAlign: TextAlign.center,
                    fontSize: 11,
                    color: Theme.of(context).colorScheme.secondary,
                    text: "Choose a sport to create new activity."),
              ],
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.inverseSurface,
              radius: 15,
              child: Image.asset(
                "assets/images/search.png",
                width: 15,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            )
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          childAspectRatio: 1,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          children: List.generate(
            items.length,
            (index) => SportItemWidget(
              isSelected: selectedItems.contains(items[index]),
              onTap: () {
                setState(() {
                  if (selectedItems.isNotEmpty) {
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
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
                textAlign: TextAlign.center,
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
                text: "Selected gender"),
            TextWidget(
                textAlign: TextAlign.center,
                fontSize: 11,
                color: Theme.of(context).colorScheme.secondary,
                text: "Select gender specific for the game"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 1, color: Theme.of(context).colorScheme.secondary),
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ExpansionTile(
            controller: _genderController,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            collapsedIconColor: Theme.of(context).colorScheme.secondary,
            title: TextWidget(
              text: gender ?? "Select gender",
              color: Theme.of(context).colorScheme.secondary,
            ),
            children: List.generate(
                genders.length,
                (index) => Container(
                      padding: const EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextWidget(
                          onTap: () {
                            _genderController.collapse();
                            setState(() {
                              gender = genders[index];
                            });
                          },
                          text: genders[index],
                          color: Theme.of(context).colorScheme.secondary,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    )),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
