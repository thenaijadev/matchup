import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/snackbar.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/teams/bloc/team_bloc.dart';

class PayToJoinTeam extends StatefulWidget {
  const PayToJoinTeam({super.key, required this.details});
  final Map<String, dynamic> details;
  @override
  State<PayToJoinTeam> createState() => _PayToJoinTeamState();
}

class _PayToJoinTeamState extends State<PayToJoinTeam> {
  @override
  void initState() {
    super.initState();
  }

  String? paymentAmount;

  bool isFree = false;
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
      backgroundColor: Theme.of(context).colorScheme.surface,
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
                hintText: "20",
                controller: controller,
                readOnly: isFree ? true : false,
                onChanged: (val) {
                  setState(() {
                    paymentAmount = val;
                  });
                },
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
                    value: isFree,
                    trackColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface),
                    inactiveThumbColor: Theme.of(context).colorScheme.primary,
                    activeColor: Theme.of(context).colorScheme.primary,
                    trackOutlineWidth: const WidgetStatePropertyAll(2),
                    trackOutlineColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.inverseSurface),
                    onChanged: (val) {
                      setState(() {
                        isFree = val;
                        if (isFree == true) {
                          controller.text = "0";
                        }
                      });
                    },
                  ),
                ),
              ]),
            ]),
            const Spacer(),
            BlocConsumer<TeamBloc, TeamState>(
              listener: (context, state) {
                if (state is TeamStateError) {
                  InfoSnackBar.showErrorSnackBar(
                      context, state.error.errorMessage);
                }
                if (state is TeamStateTeamCreated) {
                  Navigator.pushNamed(context, Routes.myTeam,
                      arguments: state.teamCreationModel);
                }
              },
              builder: (context, state) {
                return state is TeamStateIsLoading
                    ? const LoadingWidget()
                    : PrimaryButton(
                        label: "Done",
                        onPressed: () {
                          final details = {
                            ...widget.details,
                            "fee": controller.text,
                          };
                          context
                              .read<TeamBloc>()
                              .add(TeamEventCreateTeam(details: details));
                        },
                        isEnabled: true);
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
