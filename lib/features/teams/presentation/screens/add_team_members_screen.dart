import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class AddTeamMembersScreen extends StatefulWidget {
  const AddTeamMembersScreen({super.key});

  @override
  State<AddTeamMembersScreen> createState() => _AddTeamMembersScreenState();
}

class _AddTeamMembersScreenState extends State<AddTeamMembersScreen> {
  String? eventType;
  late ExpansionTileController _newPlayerController;
  List<String> teamOptions = [
    "Find new player",
    "Add and manage an existing group",
    "Find and manage (Both of the above)"
  ];
  @override
  void initState() {
    _newPlayerController = ExpansionTileController();
    super.initState();
  }

  bool isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: Transform.translate(
          offset: const Offset(15, 0),
          child: Transform.scale(
            scale: 0.7,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsets.all(15),
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
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: TextWidget(
            text: "Add team members",
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextWidget(
              text: "Add players",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1, color: Theme.of(context).colorScheme.secondary),
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ExpansionTile(
                controller: _newPlayerController,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                collapsedIconColor: Theme.of(context).colorScheme.secondary,
                title: TextWidget(
                  text: eventType ?? "Select game frame",
                  color: Theme.of(context).colorScheme.secondary,
                ),
                children: List.generate(
                    teamOptions.length,
                    (index) => Container(
                          padding: const EdgeInsets.only(left: 20),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextWidget(
                              onTap: () {
                                _newPlayerController.collapse();
                                setState(() {
                                  eventType = teamOptions[index];
                                });
                              },
                              text: teamOptions[index],
                              color: Theme.of(context).colorScheme.secondary,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        )),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "Number of players",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            TextWidget(
              text: "How many number of players are you looking for?",
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 10,
            ),
            InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "Enter the name of your team",
                verticalContentPadding: 15,
                enabledBorderRadius: 10,
                onChanged: (val) {}),
            TextWidget(
              text:
                  "A game of tennis may have 2 min players and a max player of 4",
              fontSize: 10,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              height: 20,
            ),
            const HorizontalDivider(
              thickness: 0.5,
              paddingVertical: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: "Game is online",
                      fontSize: 14,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    TextWidget(
                      text: "Toggle button to make game go offline",
                      fontSize: 9.sp,
                      color: Theme.of(context).colorScheme.secondary,
                    )
                  ],
                ),
                Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: isOnline,
                    trackColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.background),
                    inactiveThumbColor: Theme.of(context).colorScheme.primary,
                    activeColor: Theme.of(context).colorScheme.primary,
                    trackOutlineWidth: const MaterialStatePropertyAll(2),
                    trackOutlineColor: MaterialStatePropertyAll(
                        Theme.of(context).colorScheme.inverseSurface),
                    onChanged: (val) {
                      setState(() {
                        isOnline = val;
                      });
                    },
                  ),
                ),
              ],
            ),
            const Spacer(),
            PrimaryButton(
                label: "Next",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.payToJoinTeam);
                },
                isEnabled: true),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextWidget(
                text: "Skip for now",
                textAlign: TextAlign.center,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}