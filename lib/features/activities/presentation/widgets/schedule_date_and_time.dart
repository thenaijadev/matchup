import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/blocs/bloc/activity_details_bloc.dart';
import 'package:matchup/features/activities/presentation/widgets/date_picker_widget.dart';

class ScheduleDateAndTime extends StatefulWidget {
  const ScheduleDateAndTime({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<ScheduleDateAndTime> createState() => _ScheduleDateAndTimeState();
}

class _ScheduleDateAndTimeState extends State<ScheduleDateAndTime> {
  late ExpansionTileController _eventController;
  late ExpansionTileController _genderController;
  late ExpansionTileController _dateController;

  @override
  void initState() {
    _selectedYear = _selectedDate.year;
    _selectedMonth = _selectedDate.month;
    _selectedDay = _selectedDate.day;
    controller = TextEditingController();
    _eventController = ExpansionTileController();
    _genderController = ExpansionTileController();

    super.initState();
  }

  String theDate = "Date of birth";
  final DateTime _selectedDate = DateTime.now();
  late TextEditingController controller;

  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  int _selectedDay = DateTime.now().day;

  String? eventType;

  String? gender;
  String? startTimeHour;
  String? startTimeMin;
  String? endTimeHour;
  String? endTimeMin;
  String frequency = "";
  List<String> gameFrame = [
    "ONE_OFF",
    "DAILY",
    "WEEKLY",
    "MONTHLY",
    "QUARTERLY",
    "HALF_YEARLY",
    "ANNUALLY",
    "BI_ANNUALLY",
  ];
  List<String> genders = ["Males", "Females", "Mixed"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _startAndEndTimeContainerWidget(context),
        SizedBox(
          height: 20.h,
        ),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(
                  color: Theme.of(context).colorScheme.inverseSurface)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "Start time",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      TextWidget(
                        text: "When game will begin",
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                        child: CupertinoPicker(
                          selectionOverlay:
                              const CupertinoPickerDefaultSelectionOverlay(
                            capEndEdge: false,
                            capStartEdge: false,
                            background: Colors.transparent,
                          ),
                          scrollController: FixedExtentScrollController(
                              initialItem: _selectedDay - 1),
                          itemExtent: 32.0,
                          onSelectedItemChanged: (value) {
                            setState(() {
                              startTimeHour = value.toString();
                            });
                          },
                          children: List.generate(
                            24,
                            (index) => Center(
                              child: TextWidget(
                                text: index.toString().length == 1
                                    ? '0$index'
                                    : '$index',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                        child: CupertinoPicker(
                          selectionOverlay:
                              const CupertinoPickerDefaultSelectionOverlay(
                            capEndEdge: false,
                            capStartEdge: false,
                            background: Colors.transparent,
                          ),
                          scrollController: FixedExtentScrollController(
                              initialItem: _selectedDay - 1),
                          itemExtent: 32.0,
                          onSelectedItemChanged: (value) {
                            setState(() {
                              startTimeMin = value.toString();
                            });
                          },
                          children: List.generate(
                            60,
                            (index) => Center(
                              child: TextWidget(
                                text: index.toString().length == 1
                                    ? '0$index'
                                    : '$index',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: "End time",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      TextWidget(
                        text: "When game will end",
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                        color: Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 30.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                        child: CupertinoPicker(
                          selectionOverlay:
                              const CupertinoPickerDefaultSelectionOverlay(
                            capEndEdge: false,
                            capStartEdge: false,
                            background: Colors.transparent,
                          ),
                          scrollController: FixedExtentScrollController(
                              initialItem: _selectedDay - 1),
                          itemExtent: 32.0,
                          onSelectedItemChanged: (value) {
                            setState(() {
                              endTimeHour = value.toString();
                            });
                          },
                          children: List.generate(
                            24,
                            (index) => Center(
                              child: TextWidget(
                                text: index.toString().length == 1
                                    ? '0$index'
                                    : '$index',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 30.w,
                        height: 25.h,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).colorScheme.inverseSurface),
                        child: CupertinoPicker(
                          selectionOverlay:
                              const CupertinoPickerDefaultSelectionOverlay(
                            capEndEdge: false,
                            capStartEdge: false,
                            background: Colors.transparent,
                          ),
                          scrollController: FixedExtentScrollController(
                              initialItem: _selectedDay - 1),
                          itemExtent: 32.0,
                          onSelectedItemChanged: (value) {
                            setState(() {
                              endTimeMin = value.toString();
                            });
                          },
                          children: List.generate(
                            60,
                            (index) => Center(
                              child: TextWidget(
                                text: index.toString().length == 1
                                    ? '0$index'
                                    : '$index',
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        InputFieldWidget(
            controller: controller,
            onTap: () {},
            suffixIcon: Transform.scale(
              scale: 0.7,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset(
                  "assets/images/calendar.png",
                  width: 22,
                ),
              ),
            ),
            readOnly: true,
            hintSize: 12,
            hintColor: Theme.of(context).colorScheme.inversePrimary,
            hintText: "Date for game",
            enabledBorderRadius: 10,
            onChanged: (val) {}),
        SizedBox(
            height: 300.h,
            child: DatePickerWidget(
              controller: controller,
            )),
        PrimaryButton(
            label: "Next",
            onPressed: () {
              final startTime = {
                "start_time":
                    "${controller.text} ${startTimeHour ?? "00"}:${startTimeMin ?? "00"}:00"
              };
              final endTime = {
                "end_time":
                    "${controller.text} ${endTimeHour ?? "00"}:${endTimeMin ?? "00"}:00"
              };
              final startDate = {"start_date": controller.text};

              final freq = {"frequency": frequency};
              final locationName = {"location_name": "nul"};
              context.read<ActivityDetailsBloc>().add(
                      ActivityEventGatherInfoEvent(keyValue: {
                    ...startTime,
                    ...endTime,
                    ...freq,
                    ...startDate,
                    ...locationName
                  }));
              widget.pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate);
            },
            isEnabled: true),
      ],
    );
  }

  BlocBuilder _startAndEndTimeContainerWidget(BuildContext context) {
    return BlocBuilder<ActivityDetailsBloc, ActivityDetailsState>(
      builder: (context, state) {
        return state is ActivitiesInfoGathering
            ? Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Theme.of(context).colorScheme.secondary),
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  controller: _eventController,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  collapsedIconColor: Theme.of(context).colorScheme.secondary,
                  title: TextWidget(
                    text: state.formDetails["frequency"] ?? "Frequency",
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  children: List.generate(
                      gameFrame.length,
                      (index) => Container(
                            padding: const EdgeInsets.only(left: 20),
                            width: double.infinity,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: TextWidget(
                                onTap: () {
                                  _eventController.collapse();
                                  frequency = gameFrame[index];
                                },
                                text: gameFrame[index],
                                color: Theme.of(context).colorScheme.secondary,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          )),
                ),
              )
            : const SizedBox();
      },
    );
  }
}
