import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meko/Ui/Screens/Guide.dart';

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
                      padding: const EdgeInsets.only(left: 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          padding: EdgeInsets.all(12),
                          width: 300,
                          color: Colors.grey,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 80,
                                          // ! Img------------------------------
                                          child: Image.network(
                                            doucment['Img'],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              // ! appstitle------------------------------
                                              child: Text(
                                                doucment['appsname'],
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            // ! appsprice--------------------------------
                                          ],
                                        ),
                                      ],
                                    ),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Container(
                                          height: 30,
                                          width: 70,
                                          padding: EdgeInsets.all(8),
                                          color: Colors.green,
                                          // ! appsname-----------------------
                                          child: Center(
                                            child: Text(
                                              doucment['appsprice'],
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          )),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15),
                                  child: Text(
                                    doucment['appstitle'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
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
                                          width: 300,
                                          padding: EdgeInsets.all(8),
                                          color: Colors.white,
                                          // ! appsname-----------------------
                                          child: Center(
                                            child: Text(
                                              'Claim',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                          )),
                                    ),
                                  ),
                                ),
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
