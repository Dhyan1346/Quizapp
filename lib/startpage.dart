import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Opacity(
            opacity: 0.8,
            child: Image.asset(
              'assets/quiz.png',
              width: 200,
              height: 200,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Learn Flutter The Fun Way!",
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); // Call the function
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.play_arrow),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
