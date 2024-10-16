import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/blocs/activities/activities_bloc.dart';
import 'package:matchup/features/activities/presentation/widgets/completed_activities.dart';
import 'package:matchup/features/activities/presentation/widgets/ongoing_activities_widgets.dart';
import 'package:matchup/features/activities/presentation/widgets/upcoming_activities.dart';

class ActivitiesListScreen extends StatefulWidget {
  const ActivitiesListScreen({super.key});

  @override
  State<ActivitiesListScreen> createState() => _ActivitiesListScreenState();
}

class _ActivitiesListScreenState extends State<ActivitiesListScreen> {
  late PageController _controller;
  final List<Map<String, String>> items = [
    {"title": "Ongoing", "image": "assets/images/ongoing_icon.png"},
    {"title": "Completed", "image": "assets/images/note_icon.png"},
    {"title": "Up Next", "image": "assets/images/watch.png"},
  ];

  @override
  void initState() {
    _controller = PageController();
    context.read<ActivitiesBloc>().add(ActivitiesEventGetAllActivities());
    super.initState();
  }

  int _chosenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                        text: "Activities",
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        items.length,
                        (index) => GestureDetector(
                          onTap: () {
                            _controller.animateToPage(index,
                                curve: Curves.decelerate,
                                duration: const Duration(milliseconds: 500));
                            setState(() {
                              _chosenIndex = index;
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.h, vertical: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  width: 2,
                                  color: _chosenIndex == index
                                      ? Theme.of(context).colorScheme.primary
                                      : Theme.of(context)
                                          .colorScheme
                                          .inverseSurface),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  items[index]["image"]!,
                                  width: 15.w,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                TextWidget(
                                  text: items[index]["title"]!,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<ActivitiesBloc, ActivitiesState>(
                    builder: (context, state) {
                      return state is ActivitiesStateIsLoading
                          ? const Center(child: LoadingWidget())
                          : state is ActivitiesStateError
                              ? Center(
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const TextWidget(
                                        text: "There has been an error"),
                                    PrimaryButton(
                                        label: "Retry",
                                        onPressed: () {},
                                        isEnabled: true)
                                  ],
                                ))
                              : state is ActivitiesStateAllActivitiesRetreived
                                  ? Expanded(
                                      child: PageView(
                                        onPageChanged: (value) {
                                          setState(() {
                                            _chosenIndex = value;
                                          });
                                        },
                                        controller: _controller,
                                        children: [
                                          OngoingActivities(
                                              activities: state
                                                  .activitiesModel.activities),
                                          CompletedActivities(
                                              activities: state
                                                  .activitiesModel.activities),
                                          UpcomingActivities(
                                              activities: state
                                                  .activitiesModel.activities)
                                        ],
                                      ),
                                    )
                                  : const SizedBox();
                    },
                  )
                ],
              ),
              // PrimaryButton(label: "Done", onPressed: () {}, isEnabled: true),
            ],
          ),
        ),
      ),
    );
  }
}
