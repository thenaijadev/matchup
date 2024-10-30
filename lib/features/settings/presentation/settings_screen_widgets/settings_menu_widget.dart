import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/dark_mode/presentation/bloc/dark_mode_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/setting_header_widget.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/settings_item.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/settings_section.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/verified_badge_widget.dart';

class SettingsMenuWidget extends StatelessWidget {
  const SettingsMenuWidget({
    super.key,
    required this.onTap0,
    required this.onTap4,
    required this.user,
  });
  final VoidCallback onTap0;
  final VoidCallback onTap4;
  final AuthUser user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsHeaderWidget(
          user: user,
          onTap: onTap0,
        ),
        const HorizontalDivider(
          paddingVertical: 20,
          thickness: 0.5,
        ),
        SettingsSection(
          header: "Security",
          settingsItems: [
            SettingsItem(
                onTap: () {
                  Navigator.of(context).pushNamed(Routes.security);
                },
                image: "assets/images/security_icon.png",
                title: "Account security"),
            SettingsItem(
              onTap: () {},
              image: "assets/images/bio_icon.png",
              title: "Identity Verification",
              trailing: const VerifiedBadgeWidget(),
            ),
            SettingsItem(
              onTap: () {
                Navigator.pushNamed(context, Routes.privacy);
              },
              image: "assets/images/shield_icon.png",
              title: "Privacy",
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SettingsSection(
          header: "Preferences",
          settingsItems: [
            SettingsItem(
              onTap: onTap4,
              image: "assets/images/appearance_icon.png",
              title: "Appearance",
              trailing: BlocBuilder<DarkModeBloc, DarkModeState>(
                builder: (context, state) {
                  return state is DarkModeCurrentState
                      ? TextWidget(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          text: state.status,
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      : const SizedBox();
                },
              ),
            ),
            SettingsItem(
              onTap: () {
                Navigator.pushNamed(context, Routes.location);
              },
              image: "assets/images/location_pin.png",
              title: "Location",
            ),
            SettingsItem(
              onTap: () {},
              image: "assets/images/notification_bell.png",
              title: "Notifications Settings",
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SettingsSection(
          header: "Resources",
          settingsItems: [
            SettingsItem(
              onTap: () {
                Navigator.pushNamed(context, Routes.mySports);
              },
              image: "assets/images/ball_icon.png",
              title: "My Sports",
            ),
            SettingsItem(
              onTap: () {
                Navigator.pushNamed(context, Routes.teamList);
              },
              image: "assets/images/people_icon.png",
              title: "Clubs",
            ),
            SettingsItem(
              onTap: () {
                Navigator.pushNamed(context, Routes.activities);
              },
              image: "assets/images/note_icon.png",
              title: "Activities",
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SettingsSection(
          header: "Others",
          settingsItems: [
            SettingsItem(
              onTap: () {
                Navigator.pushNamed(context, Routes.invititionListScreen);
              },
              image: "assets/images/smile_emoji_icon.png",
              title: "Leave us a review",
            ),
            SettingsItem(
              onTap: () {},
              image: "assets/images/refresh_icon.png",
              title: "Update app",
            ),
            SettingsItem(
              onTap: () {},
              image: "assets/images/scroll_icon.png",
              title: "Terms & conditions",
            ),
            SettingsItem(
              onTap: () {},
              image: "assets/images/people_icon.png",
              title: "Privacy policy",
            )
          ],
        )
      ],
    );
  }
}



 // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Row(
          //       children: [
          //         GestureDetector(
          //           child: Container(
          //             height: 40,
          //             width: 40,
          //             padding: const EdgeInsets.all(10),
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(100),
          //               border: Border.all(
          //                   color: const Theme.of(context).colorScheme.inverseSurface, width: 2),
          //             ),
          //             child: Image.asset(
          //               "assets/images/arrow_back_dark.png",
          //             ),
          //           ),
          //         ),
          //         const SizedBox(
          //           width: 30,
          //         ),
          //         TextWidget(
          //           text: "Settings",
          //           fontSize: 20,
          //           color: Theme.of(context).colorScheme.inversePrimary,
          //         ),
          //       ],
          //     ),
          //   ],
          // ),
