import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({super.key, required this.controller});
  final TextEditingController controller;
  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  @override
  void initState() {
    _selectedYear = _selectedDate.year;
    _selectedMonth = _selectedDate.month;
    _selectedDay = _selectedDate.day;

    super.initState();
  }

  String theDate = "Date of birth";
  final DateTime _selectedDate = DateTime.now();

  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  int _selectedDay = DateTime.now().day;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 1,
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
                widget.controller.text =
                    '$_selectedYear-$_selectedMonth-$_selectedDay';
              });
            },
            children: List.generate(
                getDaysInMonth(_selectedYear, _selectedMonth),
                (index) => Center(child: Text('${index + 1}'))),
          ),
        ),
        Flexible(
          flex: 1,
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
                widget.controller.text =
                    '$_selectedYear-$_selectedMonth-$_selectedDay';
              });
            },
            children: List.generate(
                12, (index) => Center(child: Text(getMonthByIndex(index + 1)))),
          ),
        ),
        Flexible(
          flex: 1,
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
                widget.controller.text =
                    '$_selectedYear-$_selectedMonth-$_selectedDay';
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
