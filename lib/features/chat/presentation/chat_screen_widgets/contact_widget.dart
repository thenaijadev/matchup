import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({
    super.key,
    required this.name,
    required this.number,
    required this.isInvited,
    required this.profileImage,
    required this.onInvite,
  });
  final String name;
  final String number;
  final bool isInvited;
  final Uint8List? profileImage;
  final VoidCallback onInvite;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (profileImage == null)
                const CircleAvatar(
                  child: Icon(Icons.person),
                ),
              if (profileImage != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.memory(
                    profileImage!,
                    width: 40,
                  ),
                ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: TextWidget(
                      text: name,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  TextWidget(
                    text: number,
                    fontSize: 10,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
          if (!isInvited)
            GestureDetector(
              onTap: onInvite,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                child: TextWidget(
                  text: "Invite",
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          if (isInvited)
            GestureDetector(
              onTap: onInvite,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  ),
                ),
                child: const TextWidget(
                  text: "Invited",
                  fontSize: 13,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
