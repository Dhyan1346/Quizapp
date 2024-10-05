import 'package:flutter/material.dart';


class AnswerPage extends StatefulWidget {
  final String question;

  const AnswerPage({super.key, required this.question});

  @override
  AnswerPageState createState() => AnswerPageState();
}

class AnswerPageState extends State<AnswerPage> {
  late String answer;

  @override
  void initState() {
    super.initState();
    answer = _getAnswer(widget.question);
  }

  // A method to return answers based on the question
  String _getAnswer(String question) {
    switch (question) {
      case 'What is Flutter?':
        return 'Flutter is an open-source UI software development kit by Google.';
      case 'What is Dart?':
        return 'Dart is the programming language used to code Flutter apps.';
      case 'How do you use Stateful widgets?':
        return 'Stateful widgets are used when the UI needs to change dynamically.';
      case 'What is the use of a FutureBuilder?':
        return 'FutureBuilder is used to create widgets based on the latest snapshot of interaction with a Future.';
      default:
        return 'No answer available.';
    }
  }

  void _changeAnswer() {
    setState(() {
      answer = 'Answer changed on tap!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.question),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _changeAnswer,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}

