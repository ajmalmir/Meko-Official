import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meko/Ui/Screens/Guide.dart';
import 'package:meko/Widgets/SizeBox.dart';

class CardUtil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('appsdata').snapshots(),
      builder: (context, snapshot) {
        final list = [];

        if (snapshot.hasData) {
          final data = snapshot.data?.docs;
          for (var i in data!) {
            list.add(i.data());
          }
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final doucment = list[index];

                    // !Designing Strated here---------------------

                    return Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15)),
                        width: 200,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                // ! Img------------------------------
                                child: Image.network(
                                  doucment['Img'],
                                ),
                              ),
                              // ! appsname------------------------------
                              Column(
                                children: [
                                  Text(
                                    doucment['appsname'],
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  adh(8),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                GuideScreen(doucment: doucment),
                                          ));
                                    },
                                    child: Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius: BorderRadius.only(
                                                bottomRight:
                                                    Radius.circular(15),
                                                bottomLeft:
                                                    Radius.circular(15))),
                                        // ! appsprice-----------------------
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                'Claim',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              adw(5),
                                              Text(
                                                '₹${doucment["appsprice"]}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.green),
                                              ),
                                              adw(20),
                                            ],
                                          ),
                                        )),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                    );
                  }),
            ),
          ],
        );
      },
    );
  }
}
