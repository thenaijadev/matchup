import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/teams/data/models/team_creation_model.dart';

class MyTeamScreen extends StatefulWidget {
  const MyTeamScreen({super.key, required this.teamModel});
  final TeamCreationModel teamModel;
  @override
  State<MyTeamScreen> createState() => _PayToJoinTeamState();
}

class _PayToJoinTeamState extends State<MyTeamScreen> {
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
            text: "My Team",
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "${widget.teamModel.team?.name} ✌🏻",
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    width: 40.w,
                    height: 40.h,
                    fit: BoxFit.fitWidth,
                    widget.teamModel.team?.badge ?? "",
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
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface)),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: List.generate(
                        int.parse(widget.teamModel.team!.numberOfPlayers!),
                        (index) => Container(
                          height: 55,
                          width: 55,
                          margin: const EdgeInsets.only(left: 5),
                          decoration: BoxDecoration(
                              color:
                                  Theme.of(context).colorScheme.inverseSurface,
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.secondary)),
                          child: const Center(
                              child: TextWidget(
                            text: "👳🏻",
                            fontSize: 20,
                          )),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5.h)
                        .copyWith(left: 20.w),
                    height: 60.h,
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(100.r)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextWidget(
                          text: "Accept new invites request",
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const CircleAvatar(
                            radius: 32,
                            child: Icon(
                              Icons.add,
                              size: 30,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextWidget(
              text: "Team announcement",
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.inverseSurface)),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          widget.teamModel.user?.profileImage ?? "",
                          width: 40.w,
                          height: 40.h,
                          fit: BoxFit.fitWidth,
                          loadingBuilder:
                              (context, imageProvider, loadingProgress) {
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
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: widget.teamModel.user?.name ?? "",
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          TextWidget(
                            text:
                                "Head of ${widget.teamModel.team?.name ?? ""}",
                            fontSize: 10,
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context).colorScheme.secondary),
                        color: Theme.of(context).colorScheme.inverseSurface,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          text: "Team Updates",
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextWidget(
                          text:
                              "Lorem ipsum dolor sit amnet, connectetur adjincing eut. Porta morti plaenta vitae amnet dolor sit.Lorem ipsum dolor sit amnet, connectetur ,Lorem ipsum dolor sit amnet, connectetur ",
                          color: Theme.of(context).colorScheme.secondary,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
