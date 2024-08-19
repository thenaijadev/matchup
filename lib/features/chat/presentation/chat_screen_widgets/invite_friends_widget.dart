import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/contact_widget.dart';

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
  List<dynamic> invitedContacts = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:
            FlutterContacts.getContacts(withProperties: true, withPhoto: true),
        builder: (contex, snapShot) {
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
              const SizedBox(
                height: 20,
              ),
              InputFieldWidget(
                  prefixicon: Icon(
                    CupertinoIcons.search,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  hintColor: Theme.of(context).colorScheme.secondary,
                  hintText: "Search for friends...",
                  onChanged: (val) {}),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: !snapShot.hasData
                    ? const LoadingWidget()
                    : ListView(
                        children: List.generate(
                          snapShot.data?.length ?? 0,
                          (index) => ContactWidget(
                            name: snapShot.data?[index].displayName ?? "",
                            number: snapShot.data == null
                                ? ""
                                : snapShot.data![index].phones.isEmpty
                                    ? ""
                                    : snapShot.data?[index].phones[0].number ??
                                        "",
                            // isInvited: true,
                            isInvited:
                                invitedContacts.contains(snapShot.data?[index]),
                            profileImage: snapShot.data?[index].photo,
                            onInvite: () {
                              setState(() {
                                if (invitedContacts
                                    .contains(snapShot.data?[index])) {
                                  invitedContacts.remove(snapShot.data?[index]);
                                } else {
                                  invitedContacts.add(snapShot.data?[index]);
                                }
                              });
                            },
                          ),
                        ),
                      ),
              ),
              if (invitedContacts.isNotEmpty)
                PrimaryButton(label: "Done", onPressed: () {}, isEnabled: true),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
