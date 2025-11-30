import 'package:flutter/material.dart';
import 'package:personality_test/models/personality.dart';

final personalityMessages = {
  Personality.feeler:
      'You are a Feeler! Empathetic, warm, and guided by emotion.',
  Personality.thinker:
      'You are a Thinker! Logical, curious, and focused on ideas.',
  Personality.planner:
      'You are a Planner! Organized, strategic, and goal-oriented.',
  Personality.adventurer:
      'You are an Adventurer! Spontaneous, bold, and always exploring.',
};

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.scores,
    required this.onRestart,
  });

  final Map<Personality, int> scores;
  final void Function() onRestart;

  Personality getResultPersonality() {
    // Find personality with highest score
    var highestScore = 0;
    var resultPersonality = Personality.thinker;

    scores.forEach((personality, score) {
      if (score > highestScore) {
        highestScore = score;
        resultPersonality = personality;
      }
    });

    return resultPersonality;
  }

  @override
  Widget build(BuildContext context) {
    final resultPersonality = getResultPersonality();
    final message = personalityMessages[resultPersonality]!;

    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            OutlinedButton.icon(
              onPressed: onRestart,
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Test'),
              style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
