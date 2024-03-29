import 'package:flutter/material.dart';
import 'package:ramleela/view/components/constants/colors.dart';
import 'package:ramleela/view/screens/timeline_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
        ),
      ),
      home: const TimelineScreen(),
    );
  }
}
