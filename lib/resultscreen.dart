import 'package:flutter/material.dart';
import 'package:quizapp/quizpage.dart';

import 'ques.dart';
import 'question_summary.dart'; // Make sure you have a separate widget for this

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});

  final List<String> chosenAnswer;

  List<Map<String, Object>> getSummary() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummary();
    final numberTotal = questions.length;
    final numberCorrect = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Scaffold(
      backgroundColor: Colors.black, // Set the full background color here
      body: SizedBox(
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
            children: [
              Text(
                'You answered $numberCorrect out of $numberTotal questions correctly!',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Color for correct answers
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              QuestionSummary(summaryData), // Show the summary
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Quiz()),
                  );
                },
                child: const Text(
                  "Restart Quiz!",
                  style: TextStyle(color: Colors.white), // White text for the button
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
