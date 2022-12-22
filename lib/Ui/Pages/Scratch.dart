import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:scratcher/widgets.dart';
import 'dart:math';
import 'package:hive/hive.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
//com.example.test1
import '_withdrawlpag.dart';
import 'cart.dart';

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
    FacebookAudienceNetwork.init(
        testingId: "37b1da9d-b48c-4103-a393-2e095e734bd6", //optional
        iOSAdvertiserTrackingEnabled: true //default false
        );
    _controller = new ConfettiController(
      duration: new Duration(seconds: 1),
    );
  }

  final user = FirebaseFirestore.instance;

  ///facebook rewarded ad load
  rewardedload() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      placementId: "VID_HD_16_9_15S_LINK#YOUR_PLACEMENT_ID",
      listener: (result, value) {
        if (result == RewardedVideoAdResult.LOADED) print('loaded');
      },
    );
  }

  //this function for update coins
  coinupdate() {
    email?.put(0, FirebaseAuth.instance.currentUser?.email!);
    String emaila = email?.get(0);
    var arr = emaila.split('.');
    var finalemail = arr[0];
    final ref = FirebaseDatabase.instance.ref('users').child(finalemail);
    ref.update({'coins': allcoin});

    user.collection('newusers').doc(finalemail).update({
      "earnings": allcoin,
    });
  }

  RewardedAd? _rewardedAd;

  //this function for load ads
  loadad() {
    RewardedAd.load(
        adUnitId: Platform.isAndroid
            ? "ca-app-pub-3940256099942544/5224354917"
            : "ca-app-pub-3940256099942544/6978759866",
        request: AdRequest(), // import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'package:rxdart/rxdart.dart';
// import 'package:hive/hive.dart';
// import 'package:audioplayers/audioplayers.dart';

// Box? email = Hive.box('email');

// class SpinWheel extends StatefulWidget {
//   SpinWheel({Key? key}) : super(key: key);

//   @override
//   State<SpinWheel> createState() => _SpinWheelState();
// }

// Box? wallet = Hive.box('wallet');

// class _SpinWheelState extends State<SpinWheel> {
//   coinupdate() {
//     email?.put(0, FirebaseAuth.instance.currentUser?.email!);
//     String emaila = email?.get(0);
//     var arr = emaila.split('.');
//     var finalemail = arr[0];
//     final ref = FirebaseDatabase.instance.ref(finalemail);
//     ref.update({'coins': allcoin});
//   }

//   final selected = BehaviorSubject<int>();
//   var appbarcolor = Color(0xFF7b2fa8);

//   int rewards = 0;
//   final player = AudioCache();
//   List<int> items = [90, 10, 20, 34, 56, 78, 15];
//   // dynamic spincoin;
//   var allcoin = wallet?.get(0);

//   @override
//   void dispose() {
//     selected.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (wallet?.get(0) == null) {
//       allcoin = 0;
//     } else {
//       allcoin = wallet?.get(0);
//     }
//     return Scaffold(
//       backgroundColor: Colors.purple[50],
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             StreamBuilder(
//               stream: coinupdate(),
//               builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//                 return Text('');
//               },
//             ),
//             SizedBox(height: 50),
//             Container(
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       alignment: Alignment.topLeft,
//                       image: AssetImage('images/coin.png')),
//                   borderRadius: BorderRadius.circular(30),
//                   border: const Border(
//                     bottom: BorderSide(color: Colors.blue, width: 2),
//                     top: BorderSide(color: Colors.blue, width: 2),
//                     left: BorderSide(color: Colors.blue, width: 2),
//                     right: BorderSide(color: Colors.blue, width: 2),
//                   )),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 5, right: 5),
//                 child: Text('      $allcoin',
//                     style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w700,
//                         color: Colors.black)),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             AbsorbPointer(
//               absorbing: true,
//               child: SizedBox(
//                 height: 430,
//                 child: FortuneWheel(
//                   selected: selected.stream,
//                   animateFirst: false,
//                   items: [
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.green,
//                           borderWidth: 5),
//                       child: Text(
//                         items[0].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.black,
//                           borderWidth: 5),
//                       child: Text(
//                         items[1].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.blue,
//                           borderWidth: 5),
//                       child: Text(
//                         items[2].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.orange,
//                           borderWidth: 5),
//                       child: Text(
//                         items[3].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.grey,
//                           borderWidth: 5),
//                       child: Text(
//                         items[4].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.purple,
//                           borderWidth: 5),
//                       child: Text(
//                         items[5].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                     FortuneItem(
//                       style: FortuneItemStyle(
//                           borderColor: Colors.white,
//                           color: Colors.blueGrey,
//                           borderWidth: 5),
//                       child: Text(
//                         items[6].toString(),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                         ),
//                       ),
//                     ),
//                   ],
//                   // onAnimationStart: () {
//                   //   player.('');
//                   // },
//                   onAnimationEnd: () {
//                     setState(() {
//                       rewards = items[selected.value];
//                       showDialog(
//                           barrierDismissible: false,
//                           context: context,
//                           builder: (context) {
//                             return Container(
//                               child: AlertDialog(
//                                 actions: [
//                                   SizedBox(height: 10),
//                                   const Center(
//                                       child: Text('Congratulation..!',
//                                           style: TextStyle(
//                                               fontSize: 40,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.blue))),
//                                   Center(
//                                       child: Container(
//                                     width: 150,
//                                     height: 150,
//                                     child: Image(
//                                         image: AssetImage('images/trop.png')),
//                                   )),
//                                   Center(
//                                     child: Text(
//                                         'You Win : ' + rewards.toString(),
//                                         style: TextStyle(
//                                             fontSize: 25,
//                                             fontWeight: FontWeight.w500,
//                                             color: Colors.black)),
//                                   ),
//                                   SizedBox(
//                                     height: 20,
//                                   ),
//                                   Center(
//                                       child: MaterialButton(
//                                           onPressed: () {
//                                             setState(() {
//                                               if (allcoin == null) {
//                                                 allcoin = 0;
//                                               } else {
//                                                 allcoin = wallet?.get(0);
//                                               }
//                                               var allreward = (allcoin +
//                                                   items[selected.value]);
//                                               wallet?.put(0, allreward);
//                                             });

//                                             Navigator.pop(context);
//                                           },
//                                           height: 50,
//                                           minWidth: 120,
//                                           color: Colors.blueAccent,
//                                           shape: RoundedRectangleBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(50)),
//                                           child: Text('CLAIM',
//                                               style: TextStyle(
//                                                   color: Colors.white)))),
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                 ],
//                               ),
//                             );
//                           });
//                     });
//                   },
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               // padding: EdgeInsets.only(top: 3, left: 3),
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(50),
//                   border: const Border(
//                     bottom: BorderSide(color: Colors.yellow, width: 3),
//                     top: BorderSide(color: Colors.yellow, width: 3),
//                     left: BorderSide(color: Colors.yellow, width: 3),
//                     right: BorderSide(color: Colors.yellow, width: 3),
//                   )),
//               child: MaterialButton(
//                 onPressed: () {
//                   setState(() {
//                     selected.add(Fortune.randomInt(0, items.length));
//                   });
//                 },
//                 color: appbarcolor,
//                 child: Text('Spin',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 20,
//                     )),
//                 elevation: 10,
//                 height: 50,
//                 minWidth: 120,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(50)),
//               ),
//             ),
//           ],
//         ),
//       ),
//       // ),
//     );
//   }
// }

        rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
          _rewardedAd = ad;
        }, onAdFailedToLoad: (LoadAdError error) {
          print(error.message);
          print('Faild to Load');
        }));
  }

  //this function for Show  ads

  void showad() {
    _rewardedAd?.show(onUserEarnedReward: (ad, reward) {});

    _rewardedAd?.fullScreenContentCallback =
        FullScreenContentCallback(onAdFailedToShowFullScreenContent: (ad, err) {
      ad.dispose();
    }, onAdDismissedFullScreenContent: (ad) {
      ad.dispose();
    });
  }

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
            StreamBuilder(
              stream: coinupdate(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                return Text('');
              },
            ),

            // SizedBox(
            //   height: 120,
            // ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => withdrawalpage()));
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
                  "images/reward.png",
                  fit: BoxFit.fill,
                ),
                onScratchStart: () {
                  rewardedload();
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
                              insetPadding: EdgeInsets.symmetric(
                                horizontal: 80,
                              ),
                              actions: [
                                Container(
                                  height: 100,
                                  child: FacebookNativeAd(
                                    placementId:
                                        "IMG_16_9_APP_INSTALL#YOUR_PLACEMENT_ID",
                                    adType: NativeAdType.NATIVE_BANNER_AD,
                                    bannerAdSize: NativeBannerAdSize.HEIGHT_100,
                                    width: double.infinity,
                                    backgroundColor: Colors.blue,
                                    titleColor: Colors.white,
                                    descriptionColor: Colors.white,
                                    buttonColor: Colors.deepPurple,
                                    buttonTitleColor: Colors.white,
                                    buttonBorderColor: Colors.white,
                                    listener: (result, value) {
                                      print("Native Ad: $result --> $value");
                                    },
                                  ),
                                  //
                                ),
                                // ),
                                Center(
                                  child: Container(
                                    width: 150,
                                    height: 150,
                                    child: Image(
                                        image: AssetImage('images/winner.png')),
                                  ),
                                ),
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
                                          FacebookRewardedVideoAd
                                              .showRewardedVideoAd();
                                        },
                                        height: 45,
                                        minWidth: 120,
                                        color: appbarcolor,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Text('CLAIM',
                                            style: TextStyle(
                                                color: Colors.white)))),
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
                        "images/cong.png",
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
