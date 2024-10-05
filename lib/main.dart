import 'package:flutter/material.dart';
import 'package:quizapp/quizpage.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart'; // Required for `defaultTargetPlatform`

void main() {
  runApp(
    DevicePreview(
      enabled: !kReleaseMode, // Disables in release mode
      builder: (context) => const QuizApp(), // Wrap your app
    ),
  );
}

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Wrap with DevicePreview
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: const Quiz(),
    );
  }
}

