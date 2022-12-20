import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          width: 200,
                          color: Colors.grey[200],
                          child: Column(children: [
                            Container(
                              height: 70,
                              width: 70,
                              // ! Img------------------------------
                              child: Image.network(
                                doucment['Img'],
                              ),
                            ),
                            // ! appsname------------------------------
                            Text(
                              doucment['appsname'],
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            adh(10),

                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          GuideScreen(doucment: doucment),
                                    ));
                              },
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Container(
                                      height: 30,
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      color: Colors.white,
                                      // ! appsprice-----------------------
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Claim',
                                              style: TextStyle(
                                                  fontSize: 14,
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
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            )
                          ]),
                        ),
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
