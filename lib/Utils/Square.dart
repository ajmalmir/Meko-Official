import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareUtil extends StatefulWidget {
  VoidCallback? OnTap;

  SquareUtil({
    super.key,
    this.OnTap,
  });

  @override
  State<SquareUtil> createState() => _SquareUtilState();
}

class _SquareUtilState extends State<SquareUtil> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('cardsdata').snapshots(),
      builder: (context, snapshot) {
        final list = [];

        if (snapshot.hasData) {
          final data = snapshot.data?.docs;
          for (var i in data!) {
            list.add(i.data());
          }
        }
        // !
        return Container(
            child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context, index) {
            final document = list[index];
            // ! Designing--------------------------------------------------
            return Padding(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: GestureDetector(
                child: Container(
                  height: 110,
                  width: 100,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          child: Image.network(
                            document['Img'],
                          ),
                        ),
                        Text(
                          document['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        )
                      ]),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            );
          },
        ));
      },
    );
  }
}
