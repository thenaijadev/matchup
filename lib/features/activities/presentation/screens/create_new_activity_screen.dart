import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/presentation/widgets/create_activity.dart';
import 'package:matchup/features/activities/presentation/widgets/map_bottom_sheet.dart';
import 'package:matchup/features/activities/presentation/widgets/payment.dart';
import 'package:matchup/features/activities/presentation/widgets/schedule_date_and_time.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CreateNewActivityScreen extends StatefulWidget {
  const CreateNewActivityScreen({super.key});

  @override
  State<CreateNewActivityScreen> createState() =>
      _CreateNewActivityScreenState();
}

class _CreateNewActivityScreenState extends State<CreateNewActivityScreen> {
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool isPageTwo = false;

  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ListView(
                shrinkWrap: true,
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
                        text: page == 0
                            ? "Create Activity"
                            : page == 1
                                ? "Schedule date & time"
                                : page == 2
                                    ? "Set Location"
                                    : "Payment",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Center(
                          child: SmoothPageIndicator(
                              controller: _controller, // PageController
                              count: 4,
                              effect: ExpandingDotsEffect(
                                  radius: 10,
                                  dotWidth: 6,
                                  dotHeight: 6,
                                  activeDotColor: Theme.of(context)
                                      .colorScheme
                                      .primary), // your preferred effect
                              onDotClicked: (index) {}),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .9,
                        child: PageView(
                          onPageChanged: (value) {
                            setState(() {
                              page = value;
                            });
                          },
                          controller: _controller,
                          children: const [
                            CreateActivity(),
                            ScheduleDateAndTime(),
                            Center(
                              child: Text("Map Page"),
                            ),
                            Payment(),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              if (page != 2)
                PrimaryButton(
                    label: "Next",
                    onPressed: () {
                      if (page == 1) {
                        showModalBottomSheet(
                            isDismissible: false,
                            isScrollControlled: true,
                            scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                            showDragHandle: true,
                            enableDrag: false,
                            context: context,
                            builder: ((builderContext) {
                              return MapScreenBottomSheet(
                                  screenContext: context,
                                  onConfirmTap: () {
                                    Navigator.of(context).pop();
                                    _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.decelerate);
                                  });
                            }));
                      }
                      _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.decelerate);

                      if (page == 3) {
                        Navigator.of(context)
                            .pushNamed(Routes.activityDescripiton);
                      }
                    },
                    isEnabled: true),
              if (page == 2)
                PrimaryButton(
                    label: "Next",
                    onPressed: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          isScrollControlled: true,
                          scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                          showDragHandle: true,
                          enableDrag: false,
                          context: context,
                          builder: ((builderContext) {
                            return MapScreenBottomSheet(
                                screenContext: context,
                                onConfirmTap: () {
                                  Navigator.of(context).pop();
                                  _controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.decelerate);
                                });
                          }));
                    },
                    isEnabled: true),
            ],
          ),
        ),
      ),
    );
  }
}
