import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/home/presentation/widgets/chat_screen_widgets/contact_widget.dart';

class InviteFriendsWidget extends StatefulWidget {
  const InviteFriendsWidget({
    super.key,
    required this.changePage,
  });
  final VoidCallback changePage;

  @override
  State<InviteFriendsWidget> createState() => _InviteFriendsWidgetState();
}

class _InviteFriendsWidgetState extends State<InviteFriendsWidget> {
  List<Map<String, dynamic>> contacts = [
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
    {
      "profileImage": "assets/images/contact_image.png",
      "name": "Mary Howard",
      "number": "+(234) 90-0000-9000"
    },
  ];
  List<Map<String, dynamic>> invitedContacts = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: widget.changePage,
              child: Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                      width: 2),
                ),
                child: Image.asset(
                  "assets/images/arrow_back_dark.png",
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            TextWidget(
              text: "Invite friends",
              fontSize: 20,
              color: Theme.of(context).colorScheme.inversePrimary,
            )
          ],
        ),
        InputFieldWidget(
            prefixicon: Icon(
              CupertinoIcons.search,
              color: Theme.of(context).colorScheme.secondary,
            ),
            hintColor: Theme.of(context).colorScheme.secondary,
            hintText: "Search for nearby friends...",
            onChanged: (val) {}),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
              children: List.generate(
                  contacts.length,
                  (index) => ContactWidget(
                        name: contacts[index]["name"],
                        number: contacts[index]["number"],
                        isInvited: invitedContacts.contains(contacts[index]),
                        profileImage: contacts[index]["profileImage"],
                        onInvite: () {
                          setState(() {
                            if (invitedContacts.contains(contacts[index])) {
                              invitedContacts.remove(contacts[index]);
                            } else {
                              invitedContacts.add(contacts[index]);
                            }
                          });
                        },
                      ))),
        ),
        if (invitedContacts.isNotEmpty)
          PrimaryButton(label: "Done", onPressed: () {}, isEnabled: true),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
