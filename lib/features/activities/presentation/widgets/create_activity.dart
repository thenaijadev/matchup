import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/blocs/bloc/activity_details_bloc.dart';
import 'package:matchup/features/profile/bloc/profile_bloc.dart';
import 'package:matchup/features/profile/data/models/all_sports_model.dart';
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
    context.read<ProfileBloc>().add(const ProfileEventGetSports(authToken: ""));
    super.initState();
  }

  String? eventType;
  String? gender;

  List<String> eventTypes = ["GAME", "EXERCISE", "EVENT"];
  List<String> genders = ["MALE", "FEMALE", "ALL"];

  final List<Map<String, String>> items = [
    {"title": "Basketball", "image": "assets/images/basket_ball.png"},
    {"title": "Rugby", "image": "assets/images/rugby.png"},
    {"title": "Tennis", "image": "assets/images/tennis.png"},
    {"title": "Football", "image": "assets/images/football.png"},
    {"title": "Baseball", "image": "assets/images/baseball.png"},
    {"title": "Ice Hokey", "image": "assets/images/hockey.png"},
  ];

  final List<Sport> selectedItems = [];
  int _selectedSport = -1;
  Map<String, dynamic> value = {};
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state is ProfileStateIsLoading
            ? const LoadingWidget()
            : state is ProfileStateAllSportsGotten
                ? BlocBuilder<ActivityDetailsBloc, ActivityDetailsState>(
                    builder: (context, activitiesDetaisState) {
                      return activitiesDetaisState is ActivitiesInfoGathering
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ExpansionTile(
                                    controller: _eventController,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    collapsedIconColor:
                                        Theme.of(context).colorScheme.secondary,
                                    title: TextWidget(
                                      text: activitiesDetaisState
                                              .formDetails["type"] ??
                                          "Event type",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    children: List.generate(
                                        eventTypes.length,
                                        (index) => Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: TextWidget(
                                                  onTap: () {
                                                    _eventController.collapse();
                                                    setState(() {
                                                      context
                                                          .read<
                                                              ActivityDetailsBloc>()
                                                          .add(
                                                              ActivityEventGatherInfoEvent(
                                                                  keyValue: {
                                                                "type":
                                                                    eventTypes[
                                                                        index]
                                                              }));
                                                      // eventType =
                                                      //     eventTypes[index];
                                                    });
                                                  },
                                                  text: eventTypes[index],
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            textAlign: TextAlign.center,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .inversePrimary,
                                            text: "Choose an activity"),
                                        TextWidget(
                                            textAlign: TextAlign.center,
                                            fontSize: 11,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            text:
                                                "Choose a sport to create new activity."),
                                      ],
                                    ),
                                    CircleAvatar(
                                      backgroundColor: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                      radius: 15,
                                      child: Image.asset(
                                        "assets/images/search.png",
                                        width: 15,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
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
                                    state.sportsModel.data.length,
                                    (index) => SportItemWidget(
                                      isSelected: activitiesDetaisState
                                                  .formDetails["sport_id"] !=
                                              null
                                          ? state.sportsModel.data[index].id ==
                                              activitiesDetaisState
                                                  .formDetails["sport_id"]
                                          : false,
                                      onTap: () {
                                        setState(() {
                                          _selectedSport = index;
                                          context
                                              .read<ActivityDetailsBloc>()
                                              .add(ActivityEventGatherInfoEvent(
                                                  keyValue: {
                                                    "sport_id": state
                                                        .sportsModel
                                                        .data[index]
                                                        .id
                                                  }));
                                        });
                                      },
                                      image:
                                          state.sportsModel.data[index].image ??
                                              "",
                                      title:
                                          state.sportsModel.data[index].name!,
                                      chosenIndex: _selectedSport,
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
                                        color: Theme.of(context)
                                            .colorScheme
                                            .inversePrimary,
                                        text: "Selected gender"),
                                    TextWidget(
                                        textAlign: TextAlign.center,
                                        fontSize: 11,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary,
                                        text:
                                            "Select gender specific for the game"),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .secondary),
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ExpansionTile(
                                    controller: _genderController,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    collapsedIconColor:
                                        Theme.of(context).colorScheme.secondary,
                                    title: TextWidget(
                                      text: activitiesDetaisState
                                              .formDetails["allowed_genders"] ??
                                          "Gender",
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                    ),
                                    children: List.generate(
                                        genders.length,
                                        (index) => Container(
                                              padding: const EdgeInsets.only(
                                                  left: 20),
                                              width: double.infinity,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10.0),
                                                child: TextWidget(
                                                  onTap: () {
                                                    _genderController
                                                        .collapse();
                                                    context
                                                        .read<
                                                            ActivityDetailsBloc>()
                                                        .add(
                                                            ActivityEventGatherInfoEvent(
                                                                keyValue: {
                                                              "allowed_genders":
                                                                  genders[index]
                                                            }));
                                                    setState(() {
                                                      gender = genders[index];
                                                    });
                                                  },
                                                  text: genders[index],
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .secondary,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            )),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            )
                          : const SizedBox();
                    },
                  )
                : const SizedBox();
      },
    );
  }
}
