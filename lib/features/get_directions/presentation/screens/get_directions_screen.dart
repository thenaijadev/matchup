import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/features/get_directions/presentation/widgets/get_directions_bottom_sheet.dart';

class GetDirectionScreen extends StatefulWidget {
  const GetDirectionScreen({super.key});

  @override
  State<GetDirectionScreen> createState() => _GetDirectionScreenState();
}

class _GetDirectionScreenState extends State<GetDirectionScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      showModalBottomSheet(
          isDismissible: true,
          isScrollControlled: true,
          scrollControlDisabledMaxHeightRatio: (1 / 2.5),
          showDragHandle: true,
          enableDrag: false,
          context: context,
          builder: ((builderContext) {
            return const GetDirectionsBottomSheet();
          }));
    });
    super.initState();
  }

  @override
  void dispose() {
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
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              PrimaryButton(
                  label: "Next",
                  onPressed: () {
                    showModalBottomSheet(
                        isDismissible: true,
                        isScrollControlled: true,
                        scrollControlDisabledMaxHeightRatio: (1 / 2.5),
                        showDragHandle: true,
                        enableDrag: false,
                        context: context,
                        builder: ((builderContext) {
                          return const GetDirectionsBottomSheet();
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
