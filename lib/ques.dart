import 'package:flutter/material.dart';
import 'package:quizapp/answerbutton.dart';
import 'package:quizapp/quizquestion.dart';
import 'package:google_fonts/google_fonts.dart';

const questions = [
  Quizquestion('What is Dart?', [
    'Dart is an object-oriented programming language.',
    'Dart is used to create frontend user interfaces.',
    'Both of the above.',
    'None of the above.',
  ]),
  Quizquestion('What will be the output of this program?', [
    'Error',
    'Null',
    'Num',
    'None of these',
  ]),
  Quizquestion('Which of these is not a keyword in Dart?', [
    'factory',
    'yield',
    'export',
    'scan',
  ]),
  Quizquestion('Which framework uses Dart?', [
    'Python',
    'Java',
    'Flutter',
    'React',
  ]),
  Quizquestion('Dart is an?', [
    'Open-source',
    'Asynchronous',
    'Programming language',
    'All of the above',
  ]),
  Quizquestion('What is Dart?', [
    'Dart is an object-oriented programming language.',
    'Dart is used to create frontend user interfaces.',
    'Both of the above.',
    'None of the above.',
  ]),
];

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswer().map((answer) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AnswerButton(
                  answerText: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}