import 'package:flutter/material.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/appearance_screen_widget.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/profile_settings.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/settings_menu_widget.dart';

class SettingsScreenWidget extends StatefulWidget {
  const SettingsScreenWidget({super.key, required this.user});
  final AuthUser user;
  @override
  State<SettingsScreenWidget> createState() => _SettingsScreenWidgetState();
}

class _SettingsScreenWidgetState extends State<SettingsScreenWidget> {
  int selectedIndex = 0;
  int choice = 2;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedIndex == 0)
            SettingsMenuWidget(
                onTap0: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                onTap4: () {
                  setState(() {
                    selectedIndex = 4;
                  });
                },
                user: widget.user),
          if (selectedIndex == 1)
            ProfileSettingsWidget(
              user: widget.user,
              onTap: () {
                setState(() {
                  selectedIndex = 0;
                });
              },
            ),
          if (selectedIndex == 4)
            AppearanceWidget(onTap: () {
              setState(() {
                selectedIndex = 0;
              });
            }),
        ],
      ),
    );
  }
}
