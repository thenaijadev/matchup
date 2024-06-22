import 'package:flutter/material.dart';
import 'package:matchup/core/widgets/horizontal_divider.dart';
import 'package:matchup/core/widgets/input_field_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  bool showProfileOptions = true;
  List<Map<String, dynamic>> messages = [
    {
      "message":
          "Hi! Next week, we’ll start a new sport event. I’d tell you the details later.",
      "isMe": true,
      "time": "2:30pn"
    },
    {"message": "Hi", "isMe": false, "time": "2:30pn"},
    {
      "message":
          "Hi! Next week, we’ll start a new sport event. I’d tell you the details later.",
      "isMe": false,
      "time": "2:30pn"
    },
    {
      "message":
          "Hi! Next week, we’ll start a new sport event. I’d tell you the details later.",
      "isMe": true,
      "time": "2:30pn"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: const EdgeInsets.all(20),
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
                                          color: const Color(0xff282828),
                                          width: 2),
                                    ),
                                    child: const Icon(Icons.close)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/contact_image.png",
                        width: 60,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextWidget(
                        text: "Ester Russel",
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      TextWidget(
                        text: "@estherrussell",
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xff282828),
                            child: Icon(Icons.phone),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xff282828),
                            child: Icon(Icons.videocam),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Color(0xff282828),
                            child: Icon(Icons.more_vert),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              Row(
                children: [
                  const Expanded(
                      child: HorizontalDivider(
                    thickness: 0.5,
                    color: Color(0xff282828),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextWidget(
                      text: "Today",
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const Expanded(
                      child: HorizontalDivider(
                    color: Color(0xff282828),
                    thickness: 0.5,
                  ))
                ],
              ),
              Expanded(
                child: ListView(
                  children: List.generate(
                      messages.length,
                      (index) => Padding(
                            padding: messages[index]["isMe"]
                                ? EdgeInsets.only(
                                    left:
                                        MediaQuery.of(context).size.width * .5)
                                : EdgeInsets.only(
                                    right:
                                        MediaQuery.of(context).size.width * .5),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: const Color(0xff282828))),
                              child: Column(
                                children: [
                                  SizedBox(
                                      width: 150,
                                      child: TextWidget(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          text: messages[index]["message"])),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      TextWidget(
                                          fontSize: 8,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .secondary,
                                          text: messages[index]["time"]),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/sad_icon.png",
                      width: 20,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: InputFieldWidget(
                          suffixIcon: Icon(
                            Icons.send,
                            color: Theme.of(context).colorScheme.inversePrimary,
                          ),
                          horizontalContentPadding: 20,
                          hintSize: 12,
                          hintColor: Theme.of(context).colorScheme.secondary,
                          hintText: "Message",
                          onChanged: (val) {}),
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
