import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ActivityDescripitonScreen extends StatefulWidget {
  const ActivityDescripitonScreen({super.key});

  @override
  State<ActivityDescripitonScreen> createState() =>
      _ActivityDescripitonScreenState();
}

class _ActivityDescripitonScreenState extends State<ActivityDescripitonScreen> {
  List<Map<String, dynamic>> emojis = [
    {"name": "Terrible", "image": "😥"},
    {"name": "Bad", "image": "☹️"},
    {"name": "Okay", "image": "🙂"},
    {"name": "Good", "image": "😎"},
    {"name": "Amazing", "image": "🤗"},
  ];
  int _selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // shrinkWrap: true,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 40.w,
                          width: 40.h,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                                color: Theme.of(context)
                                    .colorScheme
                                    .inverseSurface,
                                width: 2.w),
                          ),
                          child: Image.asset(
                            "assets/images/arrow_back_dark.png",
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30.w,
                      ),
                      TextWidget(
                        text: "Descriptions",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextWidget(
                      text: "Game name",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  InputFieldWidget(
                    hintColor: Theme.of(context).colorScheme.secondary,
                    hintText: "Name of the game",
                    onChanged: (val) {},
                    enabledBorderRadius: 10,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextWidget(
                      text: "About the game",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  InputFieldWidget(
                    maxLines: 7,
                    hintColor: Theme.of(context).colorScheme.secondary,
                    hintText: "",
                    onChanged: (val) {},
                    enabledBorderRadius: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: TextWidget(
                      text: "Activity level",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
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
                                        : Theme.of(context)
                                            .colorScheme
                                            .inverseSurface),
                                color: _selectedIndex == emojiIndex
                                    ? const Color.fromARGB(22, 254, 94, 8)
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Center(
                                child: TextWidget(
                                  text: emojis[emojiIndex]["image"]!,
                                  fontSize: 25,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
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
                ],
              ),
              PrimaryButton(
                  label: "Done",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.activities);
                  },
                  isEnabled: true),
            ],
          ),
        ),
      ),
    );
  }
}