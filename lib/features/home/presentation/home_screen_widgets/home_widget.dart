// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/activities_section_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/events_carousel.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/events_section_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/home_section_header_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/news_section.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({
    super.key,
    required this.user,
  });
  final AuthUser user;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          HomeWidgetHeaderSection(
            user: user,
          ),
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
          NewsSectionWidget(user: user),
          const ActivitiesSectionWidget(),
          const EventsSection()
        ],
      ),
    );
  }
}
