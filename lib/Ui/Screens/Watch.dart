import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ContainerUtil extends StatefulWidget {
  ContainerUtil({
    super.key,
  });

  @override
  State<ContainerUtil> createState() => _ContainerUtilState();
}

class _ContainerUtilState extends State<ContainerUtil> {
  // RewardedAd? _rewardedAd;
  // loadad() {
  //   RewardedAd.load(
  //       adUnitId: Platform.isAndroid
  //           ? "ca-app-pub-3940256099942544/5224354917"
  //           : "ca-app-pub-3940256099942544/6978759866",
  //       request: AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
  //         _rewardedAd = ad;
  //         _rewardedAd?.show(onUserEarnedReward: (ad, reward) {
  //           print('Your reward is ${reward.amount}');
  //         });
  //       }, onAdFailedToLoad: (LoadAdError error) {
  //         print(error.message);
  //         print('Faild to Load');
  //       }));
  // }

  // void showad() {
  //   _rewardedAd?.show(onUserEarnedReward: (ad, reward) {
  //     print('Your reward is ${reward.amount}');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection('containerutil').snapshots(),
        builder: (context, snapshot) {
          final list = [];

          if (snapshot.connectionState == ConnectionState.waiting)
            return Text('');
          if (snapshot.hasData) {
            final data = snapshot.data?.docs;
            for (var i in data!) {
              list.add(i.data());
            }
          }
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index) {
                final document = list[index];
                // ! Designing--------------------------------------------------
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    child: Container(
                      width: 340,
                      height: 160,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),

                      // ! Main Row--------------------------------------------------{Started}

                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ! First Column-------------
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // ! title
                                      Text(document['title'],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 22)),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      // ! subtitle
                                      Text(document['subtitle'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12)),
                                    ],
                                  ),
                                  GestureDetector(
                                    
                                    child: Container(
                                        width: 100,
                                        padding: EdgeInsets.all(8),
                                        color: Colors.white,
                                        // ! appsname-----------------------
                                        child: Center(
                                          // ! Button Text
                                          child: Text(document['title'],
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14)),
                                        )),
                                  ),
                                ],
                              ),

                              // ! Img

                              Container(
                                  height: 80,
                                  width: 80,
                                  child: Image.network(document['Img']))
                              // ! First Column-------------
                            ]),
                      ),
                    ),
                  ),
                );
              });
        });
    // ! Main Row--------------------------------------------------{Ended}
  }
}
