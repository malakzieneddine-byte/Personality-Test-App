import 'package:personality_test/models/answer.dart';

class Question {
  const Question(this.text, this.answers);

  final String text;
  final List<Answer> answers;
}
