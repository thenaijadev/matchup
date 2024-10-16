import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class AppearanceWidget extends StatefulWidget {
  const AppearanceWidget({
    super.key,
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  State<AppearanceWidget> createState() => _AppearanceWidgetState();
}

class _AppearanceWidgetState extends State<AppearanceWidget> {
  int choice = 1;
  List<String> choices = [
    "Light", "Dark ", "System"
    //  "System"
  ];
  @override
  Widget build(BuildContext context) {
    return BlocListener<DarkModeBloc, DarkModeState>(
      listener: (context, state) {
        if (state is DarkModeCurrentState) {
          if (state.status == "System") {
            setState(() {
              choice = 2;
            });
          } else if (state.status == "Dark") {
            setState(() {
              choice = 1;
            });
          } else {
            setState(() {
              choice = 0;
            });
          }
        }
      },
      child: Column(
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: widget.onTap,
                child: Container(
                  height: 40.w,
                  width: 40.h,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                        color: Theme.of(context).colorScheme.secondary,
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
                text: "Appearance",
                fontSize: 20.sp,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          TextWidget(
            text:
                "Pick your color theme preference, tap to switch with your choice.",
            fontSize: 15.sp,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: List.generate(
              choices.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  // color: Theme.of(context).colorScheme.surface,
                  border: Border(
                    bottom: BorderSide(
                      width: 2,
                      color: Theme.of(context).colorScheme.inverseSurface,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: choices[index],
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    BlocBuilder<DarkModeBloc, DarkModeState>(
                      builder: (context, state) {
                        return state is DarkModeCurrentState
                            ? Transform.scale(
                                scale: 1.3,
                                child: Radio<int>(
                                  value: index,
                                  onChanged: (val) {
                                    setState(() {
                                      if (index == 0) {
                                        context.read<DarkModeBloc>().add(
                                            const ToggleDarkModeEvent(
                                                status: "Light"));
                                      }

                                      if (index == 1) {
                                        context.read<DarkModeBloc>().add(
                                            const ToggleDarkModeEvent(
                                                status: "Dark"));
                                      }

                                      if (index == 2) {
                                        context.read<DarkModeBloc>().add(
                                            const ToggleDarkModeEvent(
                                                status: "System"));
                                      }
                                    });
                                  },
                                  groupValue: state.status == "Dark"
                                      ? 1
                                      : state.status == "Light"
                                          ? 0
                                          : 2,
                                ),
                              )
                            : const SizedBox();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
