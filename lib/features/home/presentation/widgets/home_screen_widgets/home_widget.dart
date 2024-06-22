import 'package:flutter/material.dart';
import 'package:matchup/features/home/presentation/widgets/home_screen_widgets/activities_section_widget.dart';
import 'package:matchup/features/home/presentation/widgets/home_screen_widgets/events_carousel.dart';
import 'package:matchup/features/home/presentation/widgets/home_screen_widgets/events_section_widget.dart';
import 'package:matchup/features/home/presentation/widgets/home_screen_widgets/home_section_header_widget.dart';
import 'package:matchup/features/home/presentation/widgets/home_screen_widgets/news_section.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
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
          const ActivitiesSectionWidget(),
          const EventsSection()
        ],
      ),
    );
  }
}
