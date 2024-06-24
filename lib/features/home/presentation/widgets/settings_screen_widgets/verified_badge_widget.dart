import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class VerifiedBadgeWidget extends StatelessWidget {
  const VerifiedBadgeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.verified,
          size: 14,
          color: Color(0xff019949),
        ),
        SizedBox(
          width: 5,
        ),
        TextWidget(
          text: "Verified",
          color: Color(0xff019949),
          fontSize: 11,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }
}
