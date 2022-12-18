import 'package:flutter/material.dart';

class StreakPage extends StatefulWidget {
  const StreakPage({super.key});

  @override
  State<StreakPage> createState() => _StreakPageState();
}

class _StreakPageState extends State<StreakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
          child: Text(
        "Streak",
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      )),
    );
  }
}
