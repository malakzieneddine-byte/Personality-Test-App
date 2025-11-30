import 'package:flutter/material.dart';
import 'models/personality.dart';
import 'screens/start_screen.dart';
import 'screens/question_screen.dart';
import 'screens/result_screen.dart';

class PersonalityTestApp extends StatefulWidget {
  const PersonalityTestApp({super.key});

  @override
  State<PersonalityTestApp> createState() => _PersonalityTestAppState();
}

class _PersonalityTestAppState extends State<PersonalityTestApp> {
  var activeScreenName = 'start-screen';
  final Map<Personality, int> scores = {
    Personality.thinker: 0,
    Personality.feeler: 0,
    Personality.planner: 0,
    Personality.adventurer: 0,
  };

  void switchScreen() {
    setState(() {
      activeScreenName = 'question-screen';
    });
  }

  void chooseAnswer(Personality selectedPersonality) {
    setState(() {
      scores[selectedPersonality] = scores[selectedPersonality]! + 1;
    });
  }

  void showResults() {
    setState(() {
      activeScreenName = 'result-screen';
    });
  }

  void restartTest() {
    setState(() {
      scores[Personality.thinker] = 0;
      scores[Personality.feeler] = 0;
      scores[Personality.planner] = 0;
      scores[Personality.adventurer] = 0;
      activeScreenName = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(switchScreen);

    if (activeScreenName == 'question-screen') {
      activeScreen = QuestionScreen(
        onSelectAnswer: chooseAnswer,
        onFinish: showResults,
      );
    }

    if (activeScreenName == 'result-screen') {
      activeScreen = ResultScreen(scores: scores, onRestart: restartTest);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.deepPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
