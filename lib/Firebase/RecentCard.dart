import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecentCardUtil extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('appsdata').snapshots(),
      builder: (context, snapshot) {
        final list = [];
        if (snapshot.connectionState == ConnectionState.waiting)
          return Center(child: CircularProgressIndicator());
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
                  scrollDirection: Axis.vertical,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final doucment = list[index];

                    // !Designing Strated here---------------------

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey),
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Container(
                                          height: 80,
                                          width: 80,

                                          // ! Img----------------------------------
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                              doucment['Img'],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // ! appsname-------------------------------
                                          Text(
                                            doucment['appsname'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          // ! appstitle-----------------------------
                                          Text(
                                            doucment['appstitle'],
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ]),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              width: 300,
                              padding: EdgeInsets.all(5),
                              // ! appsprice------------------------------
                              child: Center(
                                child: Text(
                                  doucment['appsprice'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );

                    // !
                  }),
            ),
          ],
        );
      },
    );
  }
}
