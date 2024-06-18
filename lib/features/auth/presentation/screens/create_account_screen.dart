import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/primary_button.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/presentation/widgets/change_country.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  String? countryCode = "+234";

  bool? acceptTerms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
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
                  border: Border.all(color: const Color(0xff282828), width: 2),
                ),
                child: Image.asset(
                  "assets/images/arrow_back_dark.png",
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: TextWidget(
          text: "Set up your account",
          fontSize: 22,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
                child: TextWidget(
                    textAlign: TextAlign.center,
                    color: Theme.of(context).colorScheme.secondary,
                    text:
                        "Please complete all information to create your account on matchup."),
              ),
              InputFieldWidget(
                  hintColor: Theme.of(context).colorScheme.inversePrimary,
                  hintText: "Full Name",
                  hintSize: 12,
                  enabledBorderRadius: 10,
                  onChanged: (val) {}),
              InputFieldWidget(
                  hintSize: 12,
                  hintColor: Theme.of(context).colorScheme.inversePrimary,
                  hintText: "Email Address",
                  enabledBorderRadius: 10,
                  onChanged: (val) {}),
              InputFieldWidget(
                enabledBorderRadius: 10,
                hintColor: Theme.of(context).colorScheme.inversePrimary,

                initialValue: "",
                // initialValue: formatPhoneNumber(widget.data[0], widget.data[1]),

                prefixicon: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            changeCountry(context, (Country country) {
                              setState(() {
                                countryFlag = country.flagEmoji;
                                countryCode = country.phoneCode;
                              });
                            });
                          },
                          child: Row(
                            children: [
                              TextWidget(
                                text: '$countryFlag',
                                fontSize: 20,
                              ),
                              TextWidget(
                                text: '  +$countryCode',
                                fontSize: 12,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                            ],
                          )),
                      const SizedBox(
                        width: 15,
                      ),
                      Transform.scale(
                        scale: 0.4,
                        child: Image.asset("assets/images/line_vert.png",
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                obscureText: obscureText,
                suffixIcon: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                hintText: "",
                keyboardType: TextInputType.number,
                hintSize: 20,
                onChanged: (val) {
                  setState(() {});
                },
              ),
              InputFieldWidget(
                  hintColor: Theme.of(context).colorScheme.inversePrimary,
                  hintText: "Password",
                  hintSize: 12,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      size: 17,
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  enabledBorderRadius: 10,
                  onChanged: (val) {}),
              InputFieldWidget(
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    child: Icon(
                      size: 17,
                      obscureText
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  hintColor: Theme.of(context).colorScheme.inversePrimary,
                  hintText: "Confirm Password",
                  hintSize: 12,
                  enabledBorderRadius: 10,
                  onChanged: (val) {}),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                        value: acceptTerms,
                        // activeColor: Theme.of(context).colorScheme.secondary,
                        side: BorderSide(
                            color: Theme.of(context).colorScheme.secondary),
                        onChanged: (val) {
                          setState(() {
                            acceptTerms = val;
                          });
                        }),
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'I Agree to the ',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "satoshi",
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Use',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "satoshi",
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "satoshi",
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "satoshi",
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              PrimaryButton(
                  label: "Continue", onPressed: () {}, isEnabled: true)
            ],
          ),
        ),
      ),
    );
  }
}

String formatPhoneNumber(String number, String countryCode) {
  return "+$countryCode-${number.substring(1, 4)}-${number.substring(4, 7)}-${number.substring(7, number.length)}";
}
