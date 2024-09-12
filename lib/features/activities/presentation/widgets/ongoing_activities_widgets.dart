import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/data/models/activities/activities_model.dart';

class OngoingActivities extends StatefulWidget {
  const OngoingActivities({super.key, required this.activities});
  final List<Activities> activities;
  @override
  State<OngoingActivities> createState() => _OngoingActivitiesState();
}

class _OngoingActivitiesState extends State<OngoingActivities> {
  final List<Map<String, String>> activities = [
    {"title": "Ongoing", "image": "assets/images/ongoing_icon.png"},
    {"title": "Completed", "image": "assets/images/note_icon.png"},
    {"title": "Up Next", "image": "assets/images/watch.png"},
  ];
  @override
  Widget build(BuildContext context) {
    return activities.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Image.asset(
                "assets/images/note_pad.png",
                width: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: "No Ongoing Activities",
                color: Theme.of(context).colorScheme.secondary,
              ),
              const Spacer(),
              PrimaryButton(
                  label: "Find Activities", onPressed: () {}, isEnabled: true),
              const Spacer(),
            ],
          )
        : ListView(
            shrinkWrap: true,
            children: List.generate(
              widget.activities.length,
              (index) => GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.getDirections,
                      arguments: widget.activities[index]);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 1,
                        color: Theme.of(context).colorScheme.inverseSurface),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: widget.activities[index].name ?? "",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        text: widget.activities[index].description ?? "",
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  width: 2,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface),
                            ),
                            child: TextWidget(
                              text: "Ongoing",
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
