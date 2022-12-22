import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meko/Widgets/SizeBox.dart';

class LongContainer extends StatelessWidget {
  final String img;
  final String txt;
  final String price;
  const LongContainer({
    super.key,
    required this.img,
    required this.txt,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        // height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(img))),
                ),
                adw(15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      txt,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text('Earn up'),
                        adw(5),
                        Text(
                          '₹$price',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Apply',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                adw(5),
                FaIcon(
                  FontAwesomeIcons.arrowRightFromBracket,
                  color: Colors.green,
                  size: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
