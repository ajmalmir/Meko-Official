import 'package:flutter/material.dart';
import 'package:meko/Widgets/SizeBox.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final IconData icon;
  CircleButton({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return // ! Button-Container-------------------
        Column(
      children: [
        Container(
          
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(50)),
          child: Icon(
            icon,
            size: 30,
          ),
        ),
        adh(5),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
    // ! Button-Container-------------------
  }
}
