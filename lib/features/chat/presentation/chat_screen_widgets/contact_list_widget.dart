import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchup/core/widgets/loading_widget.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/chat/bloc/participants/participants_bloc.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/chats_widget.dart';
import 'package:matchup/features/chat/presentation/chat_screen_widgets/no_contact_witdet.dart';

class ContactListWidget extends StatefulWidget {
  const ContactListWidget({
    super.key,
    required this.changePage,
  });
  final VoidCallback changePage;

  @override
  State<ContactListWidget> createState() => _ContactListWidgetState();
}

class _ContactListWidgetState extends State<ContactListWidget> {
  List<Map<String, dynamic>> contacts = [{}];
  @override
  void initState() {
    context.read<ParticipantsBloc>().add(ParticiantEventGetParticiants());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return contacts.isEmpty
        ? NoContactWidget(changePage: widget.changePage)
        : BlocBuilder<ParticipantsBloc, ParticipantsState>(
            builder: (context, state) {
              return state is ParticipantStateIsLoading
                  ? const Center(
                      child: LoadingWidget(),
                    )
                  : state is ParticipantStateParticipantsRetrieved
                      ? ChatsWidget(participants: state.participants.data)
                      : Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextWidget(
                                text: "There has been an error",
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                              TextWidget(
                                text: "Retry",
                                fontWeight: FontWeight.bold,
                                onTap: () {
                                  context
                                      .read<ParticipantsBloc>()
                                      .add(ParticiantEventGetParticiants());
                                },
                              ),
                            ],
                          ),
                        );
            },
          );
  }
}
