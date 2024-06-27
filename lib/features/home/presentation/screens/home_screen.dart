import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/chat_screen_widget.dart';
import 'package:matchup/features/home/presentation/home_screen_widgets/home_widget.dart';
import 'package:matchup/features/search/presentation/search_screen_widgets/search_screen.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/settings_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Widget> bodyWidgets = [
    const HomeScreenWidget(),
    const SearchScreenWidget(),
    const ChatScreenWidget(),
    const SettingsScreenWidget(),
  ];
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items = [
      {"image": "assets/images/home_icon.png", "label": "Home"},
      {"image": "assets/images/search_icon.png", "label": "Search"},
      {"image": "assets/images/chat_icon.png", "label": "Chat"},
      {"image": "assets/images/settings_icon.png", "label": "Settings"},
    ];
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: bodyWidgets[_selectedIndex]),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        items[index]["image"],
                        width: index == 0 ? 30 : 25,
                        color: _selectedIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      ),
                      TextWidget(
                        text: items[index]["label"],
                        color: _selectedIndex == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondary,
                      )
                    ],
                  ),
                );
              })),
        ));
  }
}
