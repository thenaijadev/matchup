import 'package:flutter/material.dart';
import 'package:matchup/features/home/presentation/widgets/events_carousel.dart';
import 'package:matchup/features/home/presentation/widgets/home_section_header_widget.dart';
import 'package:matchup/features/home/presentation/widgets/news_section.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          const HomeWidgetHeaderSection(),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 175,
            child: EventsCarousel(
                controller: PageController(
              initialPage: 0,
              viewportFraction: .95,
            )),
          ),
          const SizedBox(
            height: 30,
          ),
          const NewsSectionWidget(),
          const ActivitiesSectionWidget()
        ],
      ),
    );
  }
}

class ActivitiesSectionWidget extends StatelessWidget {
  const ActivitiesSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [],
    );
  }
}
