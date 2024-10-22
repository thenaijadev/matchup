import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class PasscodeLockScreen extends StatefulWidget {
  const PasscodeLockScreen({super.key});

  @override
  State<PasscodeLockScreen> createState() => _PasscodeLockScreenState();
}

class _PasscodeLockScreenState extends State<PasscodeLockScreen> {
  final int _selectedIndex = 0;
  List<int> code = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        text: "Set passcode",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(code.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor:
                              Theme.of(context).colorScheme.inverseSurface,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Wrap(
                    alignment: WrapAlignment.end,
                    children: List.generate(11, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: index == 10
                            ? GestureDetector(
                                onTap: () {
                                  setState(() {
                                    code.removeLast();
                                  });
                                },
                                child: CircleAvatar(
                                    radius: 50,
                                    backgroundColor: Colors.transparent,
                                    child: Image.asset(
                                      "assets/images/clear.png",
                                      width: 40,
                                    )),
                              )
                            : InkWell(
                                onTap: () {
                                  setState(() {
                                    if (code.length < 4) {
                                      if (index != 9) {
                                        code.add(index + 1);
                                      } else {
                                        code.add(0);
                                      }
                                    }
                                  });
                                },
                                child: CircleAvatar(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .inverseSurface,
                                  radius: 50,
                                  child: index == 9
                                      ? TextWidget(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          text: "${0}",
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        )
                                      : TextWidget(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                          fontWeight: FontWeight.bold,
                                          text: "${index + 1}",
                                          fontSize: 30,
                                        ),
                                ),
                              ),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
