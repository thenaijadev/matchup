// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/auth/data/providers/local_provider.dart';
import 'package:matchup/features/chat/bloc/chats/chat_bloc.dart';
import 'package:matchup/features/chat/data/models/participants_model.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.participants,
  });
  final Participants participants;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController inputController;
  @override
  void initState() {
    inputController = TextEditingController();
    context
        .read<ChatBloc>()
        .add(ChatEventGetChat(id: widget.participants.id.toString()));
    super.initState();
  }

  bool showProfileOptions = true;
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20).copyWith(bottom: 0),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/splash_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              if (showProfileOptions)
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: Theme.of(context).colorScheme.secondary)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    showProfileOptions = false;
                                  });
                                },
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inverseSurface,
                                          width: 2),
                                    ),
                                    child: const Icon(Icons.close)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(
                          widget.participants.profileImage ?? "",
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.fitWidth,
                          errorBuilder: ((context, error, stackTrace) {
                            return CircleAvatar(
                              radius: 30.r,
                              child: const Icon(Icons.person),
                            );
                          }),
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
                        height: 20,
                      ),
                      TextWidget(
                        text: widget.participants.name ?? "",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      TextWidget(
                        text: widget.participants.email ?? "",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.inverseSurface,
                            child: Icon(
                              Icons.phone,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.inverseSurface,
                            child: Icon(
                              Icons.videocam,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor:
                                Theme.of(context).colorScheme.inverseSurface,
                            child: Icon(
                              Icons.more_vert,
                              color:
                                  Theme.of(context).colorScheme.inversePrimary,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              Row(
                children: [
                  Expanded(
                      child: HorizontalDivider(
                    thickness: 0.5,
                    color: Theme.of(context).colorScheme.inverseSurface,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextWidget(
                      text: "Today",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Expanded(
                      child: HorizontalDivider(
                    color: Theme.of(context).colorScheme.inverseSurface,
                    thickness: 0.5,
                  ))
                ],
              ),
              Expanded(
                child: BlocBuilder<ChatBloc, ChatState>(
                  builder: (context, state) {
                    return state is ChatStateIsLoading
                        ? const Center(
                            child: LoadingWidget(),
                          )
                        : state is ChatStateChatsRecieved
                            ? RefreshIndicator(
                                onRefresh: () async {
                                  context.read<ChatBloc>().add(ChatEventGetChat(
                                      id: widget.participants.id.toString()));
                                },
                                child: ListView(
                                  children: List.generate(
                                      state.chats.data.length, (index) {
                                    return FutureBuilder(
                                        future: LocalDataSource().getUser(),
                                        builder: (context, snapshot) {
                                          return Padding(
                                            padding: state.chats.data[index]
                                                        .senderId ==
                                                    snapshot.data?.user?.id
                                                ? EdgeInsets.only(
                                                    left: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .5)
                                                : EdgeInsets.only(
                                                    right:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            .5),
                                            child: Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 20),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 10),
                                              decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .background,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .secondary)),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                      width: 150,
                                                      child: TextWidget(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color:
                                                              Theme.of(context)
                                                                  .colorScheme
                                                                  .secondary,
                                                          text: state
                                                                  .chats
                                                                  .data[index]
                                                                  .message ??
                                                              "")),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      TextWidget(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 8,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                        text: DateFormat(
                                                                'yyyy-MM-dd HH:mm')
                                                            .format(state
                                                                .chats
                                                                .data[index]
                                                                .createdAt!),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        });
                                  }),
                                ),
                              )
                            : Center(
                                child: Column(
                                  children: [
                                    const TextWidget(
                                        text: "There has been an error"),
                                    TextWidget(
                                      text: "Retry",
                                      fontWeight: FontWeight.bold,
                                      onTap: () {
                                        context.read<ChatBloc>().add(
                                            ChatEventGetChat(
                                                id: widget.participants.id
                                                    .toString()));
                                      },
                                    ),
                                  ],
                                ),
                              );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/sad_icon.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    BlocListener<ChatBloc, ChatState>(
                      listener: (context, state) {
                        if (state is ChatStateMessageSent) {
                          context.read<ChatBloc>().add(ChatEventGetChat(
                              id: widget.participants.id.toString()));
                          inputController.text = "";
                        }
                      },
                      child: BlocBuilder<ChatBloc, ChatState>(
                        builder: (context, state) {
                          return Expanded(
                            child: InputFieldWidget(
                                suffixIcon: state is ChatStateIsLoading
                                    ? const Row(
                                        children: [
                                          Spacer(),
                                          LoadingWidget(),
                                          SizedBox(
                                            width: 10,
                                          )
                                        ],
                                      )
                                    : GestureDetector(
                                        onTap: () {
                                          if (state is ChatStateChatsRecieved) {
                                            context.read<ChatBloc>().add(
                                                ChatEventPostChat(
                                                    recieverId: widget
                                                        .participants.id
                                                        .toString(),
                                                    message: message));
                                          }
                                        },
                                        child: Icon(
                                          Icons.send,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .inversePrimary,
                                        ),
                                      ),
                                horizontalContentPadding: 20,
                                hintSize: 12,
                                controller: inputController,
                                hintColor:
                                    Theme.of(context).colorScheme.secondary,
                                hintText: "Message",
                                onChanged: (val) {
                                  setState(() {
                                    message = val!;
                                  });
                                }),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/images/image_icon.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      "assets/images/mic_icon.png",
                      width: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
