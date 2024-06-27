import 'package:flutter/material.dart';
import 'package:matchup/features/activities/presentation/widgets/map_bottom_sheet.dart';

class SetLoactionScreen extends StatefulWidget {
  const SetLoactionScreen({super.key});

  @override
  State<SetLoactionScreen> createState() => _SetLoactionScreenState();
}

class _SetLoactionScreenState extends State<SetLoactionScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 500), () {
      var brightness = View.of(context).platformDispatcher.platformBrightness;

      showModalBottomSheet(
          isDismissible: false,
          isScrollControlled: true,
          scrollControlDisabledMaxHeightRatio: (1 / 2.5),
          showDragHandle: true,
          enableDrag: false,
          backgroundColor: brightness == Brightness.dark
              ? const Color(0xff141414)
              : Colors.white,
          context: context,
          builder: ((context) {
            return const MapScreenBottomSheet();
          }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(
          seconds: 5,
        ),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding_one.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
        ),
      ),
    );
  }
}
