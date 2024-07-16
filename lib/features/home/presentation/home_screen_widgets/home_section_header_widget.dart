import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/models/auth_user.dart';

class HomeWidgetHeaderSection extends StatelessWidget {
  const HomeWidgetHeaderSection({
    super.key,
    required this.user,
  });
  final AuthUser user;
  @override
  Widget build(BuildContext context) {
    return Row(
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
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: "Good Morning",
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                TextWidget(
                  text: user.user?.name ?? "",
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.inversePrimary,
                )
              ],
            ),
          ],
        ),
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    width: 2),
              ),
              child: Image.asset(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 50,
                "assets/images/search.png",
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: 40,
              width: 40,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    width: 2),
              ),
              child: Image.asset(
                color: Theme.of(context).colorScheme.inversePrimary,
                width: 50,
                "assets/images/bell.png",
              ),
            ),
          ],
        )
      ],
    );
  }
}
