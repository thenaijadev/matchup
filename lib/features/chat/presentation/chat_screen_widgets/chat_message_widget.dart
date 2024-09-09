// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matchup/config/router/routes.dart';
import 'package:matchup/core/utils/logger.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({
    super.key,
    required this.participant,
  });
  final Participants participant;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        logger.e("Chat");
        Navigator.pushNamed(context, Routes.chat, arguments: participant);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                participant.profileImage ?? "",
                width: 40.w,
                height: 40.h,
                fit: BoxFit.fitWidth,
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
                      text: participant.name ?? "",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                    TextWidget(
                      text: "How are you",
                      fontSize: 10,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextWidget(
                      text: "2:45am",
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    const CircleAvatar(
                      radius: 10,
                      child: TextWidget(
                        text: "2",
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
