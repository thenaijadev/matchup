import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';
import 'package:matchup/features/auth/presentation/widgets/change_country.dart';
import 'package:matchup/features/settings/presentation/settings_screen_widgets/verified_badge_widget.dart';

class ProfileSettingsWidget extends StatefulWidget {
  const ProfileSettingsWidget(
      {super.key, required this.onTap, required this.user});
  final VoidCallback onTap;
  final AuthUser user;
  @override
  State<ProfileSettingsWidget> createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends State<ProfileSettingsWidget> {
  List<Map<String, dynamic>> stats = [
    {"title": "2", "subTitle": "Invites"},
    {"title": "10", "subTitle": "Upcoming Activities"},
    {"title": "0", "subTitle": "Join Requests"},
  ];
  bool obscureText = false;
  String? countryFlag = "🇳🇬";
  String? countryCode = "234";

  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;

  String name = "Gienna Richards";
  @override
  void initState() {
    // context.read<ProfileBloc>().add(const ProfileEventGetUser());

    _nameController = TextEditingController(text: widget.user.user?.name);
    _emailController = TextEditingController(text: widget.user.user?.email);
    _phoneNumberController =
        TextEditingController(text: widget.user.user?.phoneNumber ?? "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: widget.onTap,
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
                  text: "Profile Settings",
                  fontSize: 20.sp,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: widget.user.user?.name ?? "",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: widget.user.user?.email ?? "",
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    const VerifiedBadgeWidget(),
                  ],
                ),
                // TextWidget(
                //   text: "Gienna Richards",
                //   fontSize: 14.sp,
                //   fontWeight: FontWeight.bold,
                //   color: Theme.of(context).colorScheme.inversePrimary,
                // ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                width: 55.w,
                height: 55.h,
                fit: BoxFit.fitWidth,
                widget.user.user?.profileImage ?? "",
                loadingBuilder: (context, imageProvider, loadingProgress) {
                  if (loadingProgress == null) {
                    return imageProvider; // image is already loaded
                  }
                  return Center(
                      child: SpinKitChasingDots(
                    color: Theme.of(context).colorScheme.primary,
                  ));
                },
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 7.h),
            margin: EdgeInsets.only(
              top: 24.h,
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(23, 254, 94, 8),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/edit_profile_icon.png",
                  width: 12.w,
                ),
                SizedBox(
                  width: 10.w,
                ),
                const TextWidget(text: "Edit Profile")
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) => Expanded(
              child: Container(
                margin: index == 0
                    ? const EdgeInsets.only(right: 10)
                    : index == 1
                        ? const EdgeInsets.only(right: 10)
                        : null,
                height: 100.h,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.h),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(10.sp),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface,
                    )),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: stats[index]["title"],
                      fontSize: 28.sp,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    TextWidget(
                      text: stats[index]["subTitle"],
                      fontSize: 12.sp,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 5.h).copyWith(left: 20.w),
          height: 60.h,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inverseSurface,
              borderRadius: BorderRadius.circular(100.r)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextWidget(
                text: "Create a team",
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const CircleAvatar(
                radius: 32,
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        TextWidget(
          text: "Details",
          color: Theme.of(context).colorScheme.secondary,
        ),
        SizedBox(
          height: 10.h,
        ),
        InputFieldWidget(
            hintColor: Theme.of(context).colorScheme.inversePrimary,
            enabledBorderRadius: 10.r,
            hintText: "Full Name",
            controller: _nameController,
            onChanged: (val) {}),
        SizedBox(
          height: 10.h,
        ),
        InputFieldWidget(
            hintColor: Theme.of(context).colorScheme.inversePrimary,
            enabledBorderRadius: 10.r,
            hintText: "Email Address",
            controller: _emailController,
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
                          color: Theme.of(context).colorScheme.inversePrimary,
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
      ],
    );
  }
}
