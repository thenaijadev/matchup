import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ScheduleDateAndTime extends StatefulWidget {
  const ScheduleDateAndTime({
    super.key,
  });

  @override
  State<ScheduleDateAndTime> createState() => _ScheduleDateAndTimeState();
}

class _ScheduleDateAndTimeState extends State<ScheduleDateAndTime> {
  late ExpansionTileController _eventController;
  late ExpansionTileController _genderController;

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

  List<String> gameFrame = ["Daily", "Weekly", "Monthly"];
  List<String> genders = ["Males", "Females", "Mixed"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: Expanded(
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
                            onSelectedItemChanged: (value) {},
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
                        child: Expanded(
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
                            onSelectedItemChanged: (value) {},
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
                        child: Expanded(
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
                            onSelectedItemChanged: (value) {},
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
                        child: Expanded(
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
                            onSelectedItemChanged: (value) {},
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
        SizedBox(height: 300.h, child: _buildDatePicker(context)),
      ],
    );
  }

  Container _startAndEndTimeContainerWidget(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
            width: 1, color: Theme.of(context).colorScheme.secondary),
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        controller: _eventController,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        collapsedIconColor: Theme.of(context).colorScheme.secondary,
        title: TextWidget(
          text: eventType ?? "Select game frame",
          color: Theme.of(context).colorScheme.secondary,
        ),
        children: List.generate(
            gameFrame.length,
            (index) => Container(
                  padding: const EdgeInsets.only(left: 20),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextWidget(
                      onTap: () {
                        _eventController.collapse();
                        setState(() {
                          eventType = gameFrame[index];
                        });
                      },
                      text: gameFrame[index],
                      color: Theme.of(context).colorScheme.secondary,
                      textAlign: TextAlign.start,
                    ),
                  ),
                )),
      ),
    );
  }

  Row _buildDatePicker(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CupertinoPicker(
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              capEndEdge: false,
              background:
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            scrollController:
                FixedExtentScrollController(initialItem: _selectedDay - 1),
            itemExtent: 32.0,
            onSelectedItemChanged: (value) {
              setState(() {
                _selectedDay = value + 1;
                controller.text =
                    '$_selectedDay/$_selectedMonth/$_selectedYear';
              });
            },
            children: List.generate(
                getDaysInMonth(_selectedYear, _selectedMonth),
                (index) => Center(child: Text('${index + 1}'))),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              capStartEdge: false,
              capEndEdge: false,
              background:
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            scrollController:
                FixedExtentScrollController(initialItem: _selectedMonth - 1),
            itemExtent: 32.0,
            onSelectedItemChanged: (value) {
              setState(() {
                _selectedMonth = value + 1;
                controller.text =
                    '$_selectedDay/$_selectedMonth/$_selectedYear';
              });
            },
            children: List.generate(
                12, (index) => Center(child: Text(getMonthByIndex(index + 1)))),
          ),
        ),
        Expanded(
          child: CupertinoPicker(
            selectionOverlay: CupertinoPickerDefaultSelectionOverlay(
              capStartEdge: false,
              background:
                  Theme.of(context).colorScheme.primary.withOpacity(0.4),
            ),
            scrollController: FixedExtentScrollController(
                initialItem: _selectedYear - _selectedDate.year),
            itemExtent: 32.0,
            onSelectedItemChanged: (value) {
              setState(() {
                _selectedYear = _selectedDate.year - value;
                controller.text =
                    '$_selectedDay/$_selectedMonth/$_selectedYear';
                updateDayList();
              });
            },
            children: List.generate(
                100,
                (index) =>
                    Center(child: Text('${_selectedDate.year - index}'))),
          ),
        ),
      ],
    );
  }

  void updateDayList() {
    setState(() {});
  }

  int getDaysInMonth(int year, int month) {
    if (month == 2) {
      if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
        return 29;
      } else {
        return 28;
      }
    } else if (month == 4 || month == 6 || month == 9 || month == 11) {
      return 30;
    } else {
      return 31;
    }
  }
}

String getMonthByIndex(int index) {
  // Handle invalid index (less than 1 or greater than 12)
  if (index < 1 || index > 12) {
    throw ArgumentError(
        "Invalid month index: $index. Month index must be between 1 and 12.");
  }

  // List of month names (adjust for locale if needed)
  const List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  // Return the month based on the index (minus 1 for zero-based indexing)
  return months[index - 1];
}
