import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class GetDirectionsBottomSheet extends StatefulWidget {
  const GetDirectionsBottomSheet({super.key});

  @override
  State<GetDirectionsBottomSheet> createState() =>
      _GetDirectionsBottomSheetState();
}

class _GetDirectionsBottomSheetState extends State<GetDirectionsBottomSheet> {
  int chosenIndex = 0;
  bool isAccepted = false;
  int rating = -1;
  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  2,
                  (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        chosenIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: index == chosenIndex
                              ? isDarkMode
                                  ? const Color(0xff231F20)
                                  : const Color(0xff231F20)
                              : Colors.transparent),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 8),
                      child: TextWidget(
                          text: index == 0 ? "Details" : "Ratings",
                          color: index == chosenIndex
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.inversePrimary),
                    ),
                  ),
                ),
              )),
          SizedBox(
            height: 20.h,
          ),
          if (chosenIndex == 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Indoor Friday Afternoon Games",
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextWidget(
                  text: "Shooting Drills",
                  fontSize: 14.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(
                  height: 10.h,
                ),
                TextWidget(
                  text:
                      "We are openly and actively looking for more players to join us for a weekly indoor friday game by 5pm noon. All skills are welcome",
                  fontSize: 16.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                HorizontalDivider(
                  paddingVertical: 10,
                  color: Theme.of(context).colorScheme.inverseSurface,
                  thickness: 0.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Ask to join",
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    Transform.scale(
                      scale: 0.7,
                      child: Switch(
                        value: isAccepted,
                        trackColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.background),
                        inactiveThumbColor:
                            Theme.of(context).colorScheme.primary,
                        activeColor: Theme.of(context).colorScheme.primary,
                        trackOutlineWidth: const MaterialStatePropertyAll(2),
                        trackOutlineColor: MaterialStatePropertyAll(
                            Theme.of(context).colorScheme.inverseSurface),
                        onChanged: (val) {
                          setState(() {
                            isAccepted = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                HorizontalDivider(
                  paddingVertical: 10.h,
                  color: Theme.of(context).colorScheme.inverseSurface,
                  thickness: 0.4,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.0.h),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/location_pin.png",
                        width: 20,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      TextWidget(
                        text: "Muritala Mohammed Square - Lagos State",
                        fontSize: 15,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/male_icon.png",
                        width: 20.w,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Males Only",
                            fontSize: 15.sp,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          TextWidget(
                            text: "Gender specific for the game",
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/clock.png",
                        width: 20.w,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: "Today",
                            fontSize: 15.sp,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          TextWidget(
                            text: "05:00pm | 1hour",
                            fontSize: 12.sp,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 5.h).copyWith(left: 20.w),
                  height: 60.h,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      borderRadius: BorderRadius.circular(100.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextWidget(
                        text: "Slots open, chat with michael",
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      CircleAvatar(
                          radius: 32,
                          child: Image.asset(
                            "assets/images/chat_white.png",
                            width: 24,
                          ))
                    ],
                  ),
                ),
              ],
            ),
          if (chosenIndex == 1)
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextWidget(
                  text: "How would you rate",
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextWidget(
                  text: "The Indoor Friday Afternoon Games",
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    5,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          rating = index + 1;
                        });
                      },
                      child: rating <= index
                          ? Icon(
                              Icons.star_outline,
                              color: Theme.of(context).colorScheme.secondary,
                            )
                          : const Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InputFieldWidget(
                    enabledBorderRadius: 10,
                    maxLines: 5,
                    fillColor: Theme.of(context).colorScheme.inverseSurface,
                    verticalContentPadding: 10,
                    hintColor: Theme.of(context).colorScheme.inversePrimary,
                    hintText:
                        "Share your feedback and experience about the indoor games with us to better improve it.",
                    onChanged: (val) {}),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Image.asset(
                      "assets/images/profile_image.png",
                      width: 40,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Nickname (from your profile)",
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        TextWidget(
                          text: "GR",
                          fontSize: 13,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 100.h,
                ),
                TextWidget(
                  text:
                      "By submitting your reviews, you have given us your consent to the disclosure of your feedback",
                  fontSize: 13,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ],
            ),
          SizedBox(
            height: 20.h,
          ),
          PrimaryButton(
              label: chosenIndex == 0 ? "\$12.00" : "Leave review",
              onPressed: chosenIndex == 0 ? () {} : () {},
              isEnabled: true),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}