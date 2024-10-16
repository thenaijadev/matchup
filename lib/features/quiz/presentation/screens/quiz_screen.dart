import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:matchup/core/widgets/text_widget.dart';
import 'package:matchup/features/quiz/bloc/quiz_bloc.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});
  @override
  State<QuizScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<QuizScreen> {
  bool canAnswerQuestions = false;
  String otp = '';

  Timer? countdownTimer;
  Duration myDuration = const Duration(seconds: 60);

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();

    setState(() {
      myDuration = const Duration(seconds: 60);
      canAnswerQuestions = false;
    });
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        canAnswerQuestions = true;
        stopTimer();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
    context.read<QuizBloc>().add(QuizEventGetQuiz());
    super.initState();
  }

  bool isCorrect = false;
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');

    final seconds = strDigits(myDuration.inSeconds.remainder(60));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
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
          centerTitle: true,
          title: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 45.5.h,
                width: 45.5.w,
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  strokeWidth: 2,
                  value: (double.parse(seconds) / 60) * 1,
                ),
              ),
              Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                      width: 0.4,
                      color: Theme.of(context).colorScheme.secondary),
                ),
                child: Center(child: TextWidget(text: seconds)),
              )
            ],
          )),
      body: BlocConsumer<QuizBloc, QuizState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash_background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: state is QuizStateIsLoading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : state is QuizStateQuizRetrieved
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextWidget(
                                text:
                                    "1/${state.quiz.quiz[0].questions.length}",
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              Expanded(
                                  child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: const SizedBox(
                                  height: 10,
                                  child: LinearProgressIndicator(
                                    value: 0.3,
                                  ),
                                ),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          SizedBox(
                            width: 250.w,
                            child: TextWidget(
                                fontSize: 16.sp,
                                color: Theme.of(context)
                                    .colorScheme
                                    .inversePrimary,
                                text:
                                    state.quiz.quiz[0].questions[0].question ??
                                        ""),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Image.asset("assets/images/quiz_image.png"),
                          SizedBox(
                            height: 20.h,
                          ),
                          ...List.generate(
                              json
                                  .decode(
                                      state.quiz.quiz[0].questions[0].options ??
                                          "")
                                  .length,
                              (index) => GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isCorrect = json
                                                .decode(state.quiz.quiz[0]
                                                        .questions[0].options ??
                                                    "")
                                                .entries
                                                .elementAt(index)
                                                .value
                                                .toString() ==
                                            state.quiz.quiz[0].questions[0]
                                                .correctAnswer;
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15.h),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 11.h),
                                      decoration: BoxDecoration(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inverseSurface)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          TextWidget(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .inversePrimary,
                                              text: json
                                                  .decode(state
                                                          .quiz
                                                          .quiz[0]
                                                          .questions[0]
                                                          .options ??
                                                      "")
                                                  .entries
                                                  .elementAt(index)
                                                  .value
                                                  .toString()),
                                        ],
                                      ),
                                    ),
                                  ))
                        ],
                      )
                    : const SizedBox(),
          );
        },
      ),
    );
  }
}
