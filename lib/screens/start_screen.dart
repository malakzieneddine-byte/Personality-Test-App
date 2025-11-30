import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startTest, {super.key});

  final void Function() startTest;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Personality Test',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton(
            onPressed: startTest,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            child: const Text('Start Test'),
          ),
        ],
      ),
    );
  }
}
