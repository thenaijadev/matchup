import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/activities/blocs/bloc/activity_details_bloc.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  late TextEditingController paymentController;
  @override
  void initState() {
    paymentController = TextEditingController();
    super.initState();
  }

  bool isAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
        controller: paymentController,
        onChanged: (val) {
          context.read<ActivityDetailsBloc>().add(ActivityEventGatherInfoEvent(
              keyValue: {"fee": double.parse(paymentController.text)}));
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
            value: isAccepted,
            trackColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.background),
            inactiveThumbColor: Theme.of(context).colorScheme.primary,
            activeColor: Theme.of(context).colorScheme.primary,
            trackOutlineWidth: const MaterialStatePropertyAll(2),
            trackOutlineColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.inverseSurface),
            onChanged: (val) {
              setState(() {
                isAccepted = val;
                paymentController.text = 0.toString();
                context.read<ActivityDetailsBloc>().add(
                        ActivityEventGatherInfoEvent(keyValue: {
                      "fee": double.parse(paymentController.text)
                    }));
              });
            },
          ),
        ),
      ]),
    ]);
  }
}
