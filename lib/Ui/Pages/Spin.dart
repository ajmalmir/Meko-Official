
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

Box? email = Hive.box('email');

class SpinWheel extends StatefulWidget {
  SpinWheel({Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

Box? wallet = Hive.box('wallet');

class _SpinWheelState extends State<SpinWheel> {
 
 

  @override
  initState() {
    super.initState();
    
  }

  //facebook rewarded ad
 

  final user = FirebaseFirestore.instance;
  //coins update
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

  // RewardedAd? _rewardedAd;

  //this function for load ads
  loadad() {
    // RewardedAd.load(
    //     adUnitId: Platform.isAndroid
    //         ? "ca-app-pub-3940256099942544/5224354917"
    //         : "ca-app-pub-3940256099942544/6978759866",
    //     request: AdRequest(),
    //     rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
    //       _rewardedAd = ad;
    //     }, onAdFailedToLoad: (LoadAdError error) {
    //       print(error.message);
    //       print('Faild to Load');
    //     }));
  }

  //this function for Show  ads

  void showad() {
    // _rewardedAd?.show(onUserEarnedReward: (ad, reward) {});
    // _rewardedAd?.fullScreenContentCallback =
    //     FullScreenContentCallback(onAdFailedToShowFullScreenContent: (ad, err) {
    //   ad.dispose();
    // }, onAdDismissedFullScreenContent: (ad) {
    //   ad.dispose();
    // });
  }

  final selected = BehaviorSubject<int>();
  var appbarcolor = Color(0xFF7b2fa8);

  int rewards = 0;
  final player = AudioCache();
  List items = [2, 4, 3, 0, 2, 3, 1];

  var allcoin = wallet?.get(0);

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

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
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                StreamBuilder(
                  stream: coinupdate(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    return Text('');
                  },
                ),
                // SizedBox(height: 50),
                Container(
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
                          fontSize: 25,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                  // ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    AbsorbPointer(
                      absorbing: true,
                      child: SizedBox(
                        height: 430,
                        child: FortuneWheel(
                          selected: selected.stream,
                          animateFirst: false,
                          items: [
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Color.fromARGB(255, 9, 55, 46),
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[0].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Color.fromARGB(255, 33, 52, 220),
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[1].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Colors.purple,
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[2].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Colors.blue,
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[3].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Colors.red,
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[4].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Color.fromARGB(255, 24, 202, 193),
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[5].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                            FortuneItem(
                              style: FortuneItemStyle(
                                  // textAlign: TextAlign.end,
                                  borderColor: Colors.white,
                                  color: Color.fromARGB(255, 85, 24, 131),
                                  borderWidth: 5),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: Text(
                                  " ₹${items[6].toString()}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          onAnimationStart: () {
                            // player.play('sp5.mp3');
                          },
                          onAnimationEnd: () {
                            setState(() {
                              rewards = items[selected.value];
                              showCupertinoDialog(
                                  barrierDismissible: false,
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
                                              adType:
                                                  NativeAdType.NATIVE_BANNER_AD,
                                              bannerAdSize:
                                                  NativeBannerAdSize.HEIGHT_100,
                                              width: double.infinity,
                                              backgroundColor: Colors.blue,
                                              titleColor: Colors.white,
                                              descriptionColor: Colors.white,
                                              buttonColor: Colors.deepPurple,
                                              buttonTitleColor: Colors.white,
                                              buttonBorderColor: Colors.white,
                                              listener: (result, value) {
                                                print(
                                                    "Native Ad: $result --> $value");
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
                                                  image: AssetImage(
                                                      'images/winner.png')),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                                'You Won : ₹' +
                                                    rewards.toString(),
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
                                                        allcoin =
                                                            wallet?.get(0);
                                                      }
                                                      var allreward = (allcoin +
                                                          items[
                                                              selected.value]);
                                                      wallet?.put(0, allreward);
                                                    });

                                                    
                                                  },
                                                  height: 50,
                                                  minWidth: 120,
                                                  color: appbarcolor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text('CLAIM',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Colors.white)))),
                                        ],
                                      ),
                                    );
                                  });
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      // player.play('sp5.mp3');
                      // // loadad();
                      // rewardedload();
                      setState(() {
                        selected.add(Fortune.randomInt(0, items.length));
                      });
                    },
                    color: appbarcolor,
                    child: Text('Spin',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    elevation: 10,
                    height: 50,
                    minWidth: 120,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
