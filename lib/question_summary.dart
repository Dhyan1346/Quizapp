import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return Expanded( // Use Expanded or Flexible to avoid RenderFlex error
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
          children: summaryData.map((data) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8), // Spacing between questions
              padding: const EdgeInsets.all(10), // Padding for each question box
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Q: ${data['question']}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black, // Question text color
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Your Answer: ${data['user_answer']}',
                    style: TextStyle(
                      fontSize: 16,
                      color: data['user_answer'] == data['correct_answer']
                          ? Colors.green
                          : Colors.red, // Green for correct, Red for incorrect answers
                    ),
                  ),
                  Text(
                    'Correct Answer: ${data['correct_answer']}',
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.blue, // Correct answer text color
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
