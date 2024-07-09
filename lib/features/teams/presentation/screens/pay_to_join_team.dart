import 'package:flutter/material.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class PayToJoinTeam extends StatefulWidget {
  const PayToJoinTeam({super.key});

  @override
  State<PayToJoinTeam> createState() => _PayToJoinTeamState();
}

class _PayToJoinTeamState extends State<PayToJoinTeam> {
  @override
  void initState() {
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
            text: "Payment",
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
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextWidget(
                text: "Set payment for game",
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text:
                    "The payments are sent through ‘Sportspeaks’ secure payment platform",
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(
                height: 20,
              ),
              InputFieldWidget(
                hintColor: Theme.of(context).colorScheme.secondary,
                hintText: "",
                onChanged: (val) {},
                keyboardType: TextInputType.number,
                enabledBorderRadius: 10,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextWidget(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                  text: "Set game to free",
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
              ]),
            ]),
            const Spacer(),
            PrimaryButton(
                label: "Done",
                onPressed: () {
                  Navigator.pushNamed(context, Routes.myTeam);
                },
                isEnabled: true),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}