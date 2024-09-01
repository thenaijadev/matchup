class QuizModel {
  QuizModel({
    required this.quiz,
    required this.message,
    required this.success,
  });

  final List<Quiz> quiz;
  final String? message;
  final bool? success;

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      quiz: json["quiz"] == null
          ? []
          : List<Quiz>.from(json["quiz"]!.map((x) => Quiz.fromJson(x))),
      message: json["message"],
      success: json["success"],
    );
  }

  Map<String, dynamic> toJson() => {
        "quiz": quiz.map((x) => x.toJson()).toList(),
        "message": message,
        "success": success,
      };
}

class Quiz {
  Quiz({
    required this.id,
    required this.quizName,
    required this.instructions,
    required this.createdAt,
    required this.updatedAt,
    required this.questions,
    required this.attempt,
  });

  final int? id;
  final String? quizName;
  final String? instructions;
  final dynamic createdAt;
  final dynamic updatedAt;
  final List<Question> questions;
  final List<dynamic> attempt;

  factory Quiz.fromJson(Map<String, dynamic> json) {
    return Quiz(
      id: json["id"],
      quizName: json["quiz_name"],
      instructions: json["instructions"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
      questions: json["questions"] == null
          ? []
          : List<Question>.from(
              json["questions"]!.map((x) => Question.fromJson(x))),
      attempt: json["attempt"] == null
          ? []
          : List<dynamic>.from(json["attempt"]!.map((x) => x)),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_name": quizName,
        "instructions": instructions,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "questions": questions.map((x) => x.toJson()).toList(),
        "attempt": attempt.map((x) => x).toList(),
      };
}

class Question {
  Question({
    required this.id,
    required this.quizId,
    required this.question,
    required this.image,
    required this.options,
    required this.correctAnswer,
    required this.timeAllowed,
    required this.score,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final int? quizId;
  final String? question;
  final dynamic image;
  final String? options;
  final String? correctAnswer;
  final int? timeAllowed;
  final int? score;
  final dynamic createdAt;
  final dynamic updatedAt;

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json["id"],
      quizId: json["quiz_id"],
      question: json["question"],
      image: json["image"],
      options: json["options"],
      correctAnswer: json["correct_answer"],
      timeAllowed: json["time_allowed"],
      score: json["score"],
      createdAt: json["created_at"],
      updatedAt: json["updated_at"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "quiz_id": quizId,
        "question": question,
        "image": image,
        "options": options,
        "correct_answer": correctAnswer,
        "time_allowed": timeAllowed,
        "score": score,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
