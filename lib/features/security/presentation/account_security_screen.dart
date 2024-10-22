import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class AccountSecurityScreen extends StatefulWidget {
  const AccountSecurityScreen({super.key});

  @override
  State<AccountSecurityScreen> createState() => _AccountSecurityScreenState();
}

class _AccountSecurityScreenState extends State<AccountSecurityScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash_background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
              child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40.w,
                      width: 40.h,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Theme.of(context).colorScheme.inverseSurface,
                            width: 2.w),
                      ),
                      child: Image.asset(
                        "assets/images/arrow_back_dark.png",
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  TextWidget(
                    text: "Account Security",
                    fontWeight: FontWeight.bold,
                    fontSize: 20.sp,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Enable passcode protect",
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    Radio(
                        value: 0,
                        groupValue: _selectedIndex,
                        onChanged: (val) {
                          setState(() {
                            _selectedIndex = val!;
                            if (_selectedIndex == 0) {
                              Navigator.pushNamed(context, Routes.pinLock);
                            }
                          });
                        }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 0.5,
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextWidget(
                      text: "Enable passcode protect",
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.w500,
                    ),
                    Radio(
                        value: 1,
                        groupValue: _selectedIndex,
                        onChanged: (val) {
                          setState(() {
                            _selectedIndex = val!;
                            if (_selectedIndex == 1) {
                              // Navigator.pushNamed(context, routeName)
                            }
                          });
                        }),
                  ],
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}
