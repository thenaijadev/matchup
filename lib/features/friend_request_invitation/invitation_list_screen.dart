import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class InvitationListScreen extends StatefulWidget {
  const InvitationListScreen({super.key});

  @override
  State<InvitationListScreen> createState() => _InvitationListScreenState();
}

class _InvitationListScreenState extends State<InvitationListScreen> {
  bool isEmpty = false;
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
              child: isEmpty
                  ? const NoInvitationsWidget()
                  : Column(
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
                                      color: Theme.of(context)
                                          .colorScheme
                                          .inverseSurface,
                                      width: 2.w),
                                ),
                                child: Image.asset(
                                  "assets/images/arrow_back_dark.png",
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            TextWidget(
                              text: "Invitations",
                              fontWeight: FontWeight.bold,
                              fontSize: 20.sp,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ...List.generate(2, (index) {
                          return const InvitationWidget();
                        }),
                      ],
                    )),
        ),
      ),
    );
  }
}

class InvitationWidget extends StatelessWidget {
  const InvitationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: const CircleAvatar(
                    radius: 25, child: Icon(Icons.power_off_outlined)),
                // child: Image.network(
                //   width: 40.w,
                //   height: 40.h,
                //   fit: BoxFit.fitWidth,
                //   "  user.user?.profileImage" ?? "",
                //   loadingBuilder:
                //       (context, imageProvider, loadingProgress) {
                //     if (loadingProgress == null) {
                //       return imageProvider; // image is already loaded
                //     }
                //     return Center(
                //         child: SpinKitChasingDots(
                //       color:
                //           Theme.of(context).colorScheme.primary,
                //     ));
                //   },
                // ),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    text: "Mary Howard",
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                  TextWidget(
                    text: "Requested to be your friend",
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  TextWidget(
                    text: "5 Mutual Friend",
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(40)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                child: const TextWidget(
                  fontWeight: FontWeight.bold,
                  text: "Invite",
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextWidget(
                text: "Decline",
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 10,
              )
            ],
          )
        ],
      ),
    );
  }
}

class NoInvitationsWidget extends StatelessWidget {
  const NoInvitationsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
              text: "Invitations",
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Image.asset(
              "assets/images/notes_icon.png",
              width: 200,
            ),
            TextWidget(
              text: "You have no invitations yet",
              fontSize: 20,
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget(
              textAlign: TextAlign.center,
              text: "Invite your friends from your contact to join Sportspeaks",
              fontSize: 14,
              color: Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        const Spacer(),
        const Spacer(),
      ],
    );
  }
}
