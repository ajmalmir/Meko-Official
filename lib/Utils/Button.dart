import 'package:flutter/material.dart';
import 'package:meko/Ui/Pages/Profile.dart';

class ButtonUtil extends StatelessWidget {
  final Color textcolour;
  final Color backgroundColor;
  Color bordercolor;
  double borderRadius;
  String? text;
  IconData? icon;
  double size;
  bool isIcon;
  VoidCallback OnTap;

  ButtonUtil({
    super.key,
    required this.textcolour,
    required this.backgroundColor,
    required this.bordercolor,
    required this.borderRadius,
    this.text,
    required this.size,
    required this.OnTap,
    this.isIcon = false,
    this.icon,
    // this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          )),
      child: GestureDetector(
        onTap: OnTap,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 55,
            height: 55,
            child: Container(
              child: Center(
                child: Icon(
                  icon,
                  color: textcolour,
                  size: size,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: backgroundColor,
              border: Border.all(color: bordercolor, width: 1.0),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
        ),
      ),
    );
  }
}
