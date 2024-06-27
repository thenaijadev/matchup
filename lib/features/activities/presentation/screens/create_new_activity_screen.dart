import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/presentation/widgets/create_activity.dart';
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
                            : "Schedule date & time",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
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
                      children: const [CreateActivity(), ScheduleDateAndTime()],
                    ),
                  )
                ],
              ),
              PrimaryButton(
                  label: "Next",
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.decelerate);
                    if (_controller.page == 1) {
                      Navigator.pushNamed(context, Routes.setLocation);
                    }
                  },
                  isEnabled: true)
            ],
          ),
        ),
      ),
    );
  }
}
