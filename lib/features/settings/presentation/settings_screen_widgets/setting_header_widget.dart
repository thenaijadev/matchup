import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';

class SettingsHeaderWidget extends StatelessWidget {
  const SettingsHeaderWidget({
    super.key,
    required this.onTap,
    required this.user,
  });
  final VoidCallback onTap;
  final AuthUser user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.fitWidth,
                    user.user?.profileImage ?? "",
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
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: user.user?.name ?? "",
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        TextWidget(
                          text: "View profile",
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}
