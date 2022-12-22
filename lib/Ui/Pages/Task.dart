import 'package:flutter/material.dart';
import 'package:meko/Firebase/RecentCard.dart';

class TaskPage extends StatefulWidget {
  const TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'T A S K',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.grey[300],
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: RecentCardUtil(),
        ));
  }
}
