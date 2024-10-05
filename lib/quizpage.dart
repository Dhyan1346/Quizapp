import 'package:flutter/material.dart';
import 'package:quizapp/ques.dart';
import 'package:quizapp/resultscreen.dart';
import 'package:quizapp/startpage.dart';




class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<String> chosenAnswers = [];

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen() {
    setState(() {
      activeScreen = QuestionsScreen(onSelectAnswer: _handleAnswer);
    });
  }

  void _handleAnswer(String answer) {
    chosenAnswers.add(answer); // Collect chosen answers
    if (chosenAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultScreen(chosenAnswer: chosenAnswers); // Go to result screen
      });
    } else {
      setState(() {
        activeScreen = QuestionsScreen(onSelectAnswer: _handleAnswer); // Continue quiz
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8E2DE2),
                Color(0xFF4A00E0),
              ],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}

