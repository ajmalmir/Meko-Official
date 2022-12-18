import 'package:flutter/material.dart';

class GuideScreen extends StatefulWidget {
  final doucment;
  GuideScreen({super.key, this.doucment});

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        title: Text('How to Claim Your Reward'),
      ),
      body: Column(
        children: [Center(child: Text(''))],
      ),
    );
  }
}
