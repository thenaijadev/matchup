import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class DateOfBirthScreen extends StatefulWidget {
  const DateOfBirthScreen({super.key});

  @override
  State<DateOfBirthScreen> createState() => _DateOfBirthScreenState();
}

class _DateOfBirthScreenState extends State<DateOfBirthScreen> {
  String theDate = "Date of birth";
  final DateTime _selectedDate = DateTime.now();
  late TextEditingController controller;

  int _selectedYear = DateTime.now().year;
  int _selectedMonth = DateTime.now().month;
  int _selectedDay = DateTime.now().day;
  @override
  void initState() {
    _selectedYear = _selectedDate.year;
    _selectedMonth = _selectedDate.month;
    _selectedDay = _selectedDate.day;
    controller = TextEditingController();
    super.initState();
  }

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
          text: "Set up your account",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: TextWidget(
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    text:
                        "To give you the best experience possible, we’d like to know a little about you."),
              ),
              const SizedBox(
                height: 50,
              ),
              Image.asset(
                "assets/images/birthday.png",
                width: 200,
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
                  hintText: "Date of birth",
                  enabledBorderRadius: 10,
                  onChanged: (val) {}),
              SizedBox(height: 280, child: _buildDatePicker(context)),
              PrimaryButton(
                  label: "Continue",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.genderChoice);
                  },
                  isEnabled: true)
            ],
          ),
        ),
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
                12, (index) => Center(child: Text('${index + 1}'))),
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