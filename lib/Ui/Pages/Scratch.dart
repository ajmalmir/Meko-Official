import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:facebook_audience_network/facebook_audience_network.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:meko/Ui/Pages/Wallet.dart';
import 'package:scratcher/widgets.dart';
import 'dart:math';
import 'package:hive/hive.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:io';
//com.example.test1

Box? wallet = Hive.box('wallet');
Box? email = Hive.box('email');
var appbarcolor = Color(0xFF7b2fa8);

class scratch extends StatefulWidget {
  @override
  _scratchState createState() => _scratchState();
}

class _scratchState extends State<scratch> {
  List<double> items = [1.5, 10, 3, 20, 2, 40, 70, 4, 45, 45];

  var allcoin = wallet?.get(0);
  late ConfettiController _controller;
  var RandomNumber;
  var ra;
  final scratchkey = GlobalKey<ScratcherState>();
  @override
  void initState() {
    super.initState();
    // FacebookAudienceNetwork.init(
    //     testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
    //     iOSAdvertiserTrackingEnabled: true //default false
    //     );
    _controller = new ConfettiController(
      duration: new Duration(seconds: 1),
    );
  }

  final user = FirebaseFirestore.instance;

  // ///facebook rewarded ad load
  // rewardedload() {
  //   FacebookRewardedVideoAd.loadRewardedVideoAd(
  //     placementId: "VID_HD_16_9_15S_LINK#YOUR_PLACEMENT_ID",
  //     listener: (result, value) {
  //       if (result == RewardedVideoAdResult.LOADED) print('loaded');
  //     },
  //   );
  // }

  //this function for update coins
  // coinupdate() {
  //   email?.put(0, FirebaseAuth.instance.currentUser?.email!);
  //   String emaila = email?.get(0);
  //   var arr = emaila.split('.');
  //   var finalemail = arr[0];
  //   final ref = FirebaseDatabase.instance.ref('users').child(finalemail);
  //   ref.update({'coins': allcoin});

  //   user.collection('newusers').doc(finalemail).update({
  //     "earnings": allcoin,
  //   });
  // }

  // RewardedAd? _rewardedAd;

  //this function for load ads
  // loadad() {
  //   RewardedAd.load(
  //       adUnitId: Platform.isAndroid
  //           ? "ca-app-pub-3940256099942544/5224354917"
  //           : "ca-app-pub-3940256099942544/6978759866",
  //       request: AdRequest(),
  //       rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
  //         _rewardedAd = ad;
  //       }, onAdFailedToLoad: (LoadAdError error) {
  //         print(error.message);
  //         print('Faild to Load');
  //       }));
  // }

  //this function for Show  ads

  // void showad() {
  //   _rewardedAd?.show(onUserEarnedReward: (ad, reward) {});

  //   _rewardedAd?.fullScreenContentCallback =
  //       FullScreenContentCallback(onAdFailedToShowFullScreenContent: (ad, err) {
  //     ad.dispose();
  //   }, onAdDismissedFullScreenContent: (ad) {
  //     ad.dispose();
  //   });
  // }

  bool _enabled = true;
  @override
  Widget build(BuildContext context) {
    if (wallet?.get(0) == null) {
      allcoin = 0;
    } else {
      allcoin = wallet?.get(0);
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.purple[50],
        elevation: 0,
      ),
      backgroundColor: Colors.purple[50],
      body: SingleChildScrollView(
        child: Column(
          children: [
            // StreamBuilder(
            //   stream: coinupdate(),
            //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //     return Text('');
            //   },
            // ),

            // SizedBox(
            //   height: 120,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WalletPage()));
              },
              child: Container(
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         alignment: Alignment.topLeft,
                //         image: AssetImage('images/coin.png')),
                //     borderRadius: BorderRadius.circular(30),
                //     border: const Border(
                //       bottom: BorderSide(color: Colors.blue, width: 2),
                //       top: BorderSide(color: Colors.blue, width: 2),
                //       left: BorderSide(color: Colors.blue, width: 2),
                //       right: BorderSide(color: Colors.blue, width: 2),
                //     )),
                // child: Padding(
                //   padding: const EdgeInsets.only(left: 5, right: 5),
                child: Text('₹$allcoin',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black)),
                // ),
              ),
            ),
            // SizedBox(
            //   height: 10,
            // ),
            // Text('Scratch and Win',
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500,color:Colors.white)),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Scratcher(
                key: scratchkey,
                enabled: _enabled,
                brushSize: 50,
                threshold: 50,
                color: Colors.yellow,
                image: Image.asset(
                  "images/1.jpg",
                  fit: BoxFit.fill,
                ),
                onScratchStart: () {
                  // rewardedload();
                  // loadad();
                  setState(() {
                    RandomNumber = (Random().nextInt(4) + 1);
                  });
                },
                onThreshold: () {
                  _controller.play();
                  setState(() {
                    _enabled = true;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Container(
                            child: AlertDialog(
                              actions: [
                                SizedBox(height: 10),
                                Center(
                                    child: Text('Congratulation..!',
                                        style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.blue))),
                                Center(
                                    child: Container(
                                  width: 150,
                                  height: 150,
                                  child: Image(
                                      image: AssetImage('images/king.png')),
                                )),
                                Center(
                                  child: Text('You Win ₹$RandomNumber',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black)),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Center(
                                    child: MaterialButton(
                                        onPressed: () {
                                          setState(() {
                                            if (allcoin == null) {
                                              allcoin = 0;
                                            } else {
                                              allcoin = wallet?.get(0);
                                            }
                                            var allreward =
                                                (allcoin + RandomNumber);
                                            wallet?.put(0, allreward);
                                          });

                                          scratchkey.currentState?.reset(
                                              duration:
                                                  Duration(microseconds: 200));
                                          Navigator.pop(context);
                                          // showad();
                                          // FacebookRewardedVideoAd
                                          //     .showRewardedVideoAd();
                                        },
                                        height: 45,
                                        minWidth: 120,
                                        color: appbarcolor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text('CLAIM',
                                            style: TextStyle(
                                                color: Colors.white)))),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        });
                  });
                },
                // onThreshold: () => _controller.play(),
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/1.jpg",
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200,
                      ),
                      Column(
                        children: [
                          ConfettiWidget(
                            blastDirectionality: BlastDirectionality.explosive,
                            confettiController: _controller,
                            particleDrag: 0.05,
                            emissionFrequency: 0.05,
                            numberOfParticles: 100,
                            gravity: 0.05,
                            shouldLoop: false,
                            colors: [
                              Colors.green,
                              Colors.red,
                              Colors.yellow,
                              Colors.blue,
                            ],
                          ),
                          Text(
                            "You won",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            "₹$RandomNumber",
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
