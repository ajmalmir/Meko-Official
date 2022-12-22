import 'package:flutter/material.dart';
import 'package:meko/Widgets/SizeBox.dart';

class CircleButton extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback onTap;
  CircleButton(
      {super.key, required this.text, required this.onTap, required this.img});

  @override
  Widget build(BuildContext context) {
    return // ! Button-Container-------------------
        GestureDetector(
      onTap: onTap,
      child: Column(

        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: Container(
              height: 30,
              width: 30,
              decoration:
                  BoxDecoration(image: DecorationImage(image: AssetImage(img,))),
            ),
          ),
          adh(5),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
    // ! Button-Container-------------------
  }
}
