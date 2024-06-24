import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/home/presentation/widgets/settings_screen_widgets/settings_item.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection(
      {super.key, required this.header, required this.settingsItems});
  final String header;
  final List<SettingsItem> settingsItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextWidget(
          text: header,
          fontSize: 11,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: settingsItems,
        )
      ],
    );
  }
}
