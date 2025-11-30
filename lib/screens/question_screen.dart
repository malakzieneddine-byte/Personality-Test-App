import 'package:flutter/material.dart';
import 'package:personality_test/data/questions.dart';
import 'package:personality_test/models/personality.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.onSelectAnswer,
    required this.onFinish,
  });

  final void Function(Personality) onSelectAnswer;
  final void Function() onFinish;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(Personality selectedPersonality) {
    widget.onSelectAnswer(selectedPersonality);

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        widget.onFinish();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.answers.map((answer) {
              return ElevatedButton(
                onPressed: () {
                  answerQuestion(answer.personality);
                },
                child: Text(answer.text),
              );
            }),
          ],
        ),
      ),
    );
  }
}
