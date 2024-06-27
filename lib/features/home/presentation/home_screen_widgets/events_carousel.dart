import 'package:flutter/material.dart';

class EventsCarousel extends StatelessWidget {
  const EventsCarousel({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      padEnds: true,
      scrollDirection: Axis.horizontal,
      children: List.generate(
        3,
        (index) => Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 160,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
