import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/home/presentation/widgets/settings_screen_widgets/setting_header_widget.dart';
import 'package:matchup/features/home/presentation/widgets/settings_screen_widgets/settings_item.dart';
import 'package:matchup/features/home/presentation/widgets/settings_screen_widgets/settings_section.dart';
import 'package:matchup/features/home/presentation/widgets/settings_screen_widgets/verified_badge_widget.dart';

class SettingsScreenWidget extends StatelessWidget {
  const SettingsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          //                   color: const Color(0xff282828), width: 2),
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

          const SettingsHeaderWidget(),
          const HorizontalDivider(
            paddingVertical: 20,
            thickness: 0.5,
          ),
          SettingsSection(
            header: "Security",
            settingsItems: [
              SettingsItem(
                  onTap: () {},
                  image: "assets/images/security_icon.png",
                  title: "Account security"),
              SettingsItem(
                onTap: () {},
                image: "assets/images/bio_icon.png",
                title: "Identity Verification",
                trailing: const VerifiedBadgeWidget(),
              ),
              SettingsItem(
                onTap: () {},
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
                onTap: () {},
                image: "assets/images/appearance_icon.png",
                title: "Appearance",
                trailing: TextWidget(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  text: "System",
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SettingsItem(
                onTap: () {},
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
                onTap: () {},
                image: "assets/images/ball_icon.png",
                title: "My Sports",
                trailing: TextWidget(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  text: "System",
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SettingsItem(
                onTap: () {},
                image: "assets/images/people_icon.png",
                title: "Clubs",
              ),
              SettingsItem(
                onTap: () {},
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
                onTap: () {},
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
      ),
    );
  }
}
