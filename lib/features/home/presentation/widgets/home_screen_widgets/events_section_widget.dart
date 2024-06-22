import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/home/presentation/widgets/home_screen_widgets/events_carousel.dart';

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(
          height: 20,
        ),
        TextWidget(
          text: "Activities",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        TextWidget(
          text: "Based on your sport of interest",
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
            height: 160,
            child: EventsCarousel(
                controller: PageController(viewportFraction: .9))),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
