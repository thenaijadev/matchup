import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(
      {super.key,
      required this.image,
      required this.title,
      this.trailing,
      required this.onTap});
  final String image;
  final String title;
  final Widget? trailing;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: const Color(0xff282828),
                child: Image.asset(
                  image,
                  width: 18,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              TextWidget(
                text: title,
                color: Theme.of(context).colorScheme.inversePrimary,
              )
            ],
          ),
          if (trailing != null) trailing!
        ],
      ),
    );
  }
}
