// // https://github.com/vagish1/AdMob-Ad-App/blob/main/lib/main.dart
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'dart:io';

// class adstest extends StatefulWidget {
//   adstest({Key? key}) : super(key: key);

//   @override
//   State<adstest> createState() => _adstestState();
// }

// DatabaseReference ref = FirebaseDatabase.instance.ref();

// class _adstestState extends State<adstest> {
//   RewardedAd? _rewardedAd;
//   loadad() {
//     RewardedAd.load(
//         adUnitId: Platform.isAndroid
//             ? "ca-app-pub-3940256099942544/5224354917"
//             : "ca-app-pub-3940256099942544/6978759866",
//         request: AdRequest(),
//         rewardedAdLoadCallback: RewardedAdLoadCallback(onAdLoaded: (ad) {
//           _rewardedAd = ad;
//           _rewardedAd?.show(onUserEarnedReward: (ad, reward) {
//             print('Your reward is ${reward.amount}');
//           });
//         }, onAdFailedToLoad: (LoadAdError error) {
//           print(error.message);
//           print('Faild to Load');
//         }));
//   }

//   showad() {
//     _rewardedAd?.show(onUserEarnedReward: (ad, reward) {
//       print('Your reward is ${reward.amount}');
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Center(
//           child: Column(children: [
//         StreamBuilder(
//           stream: showad(),
//           builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//             return Text('');
//           },
//         ),
//         SizedBox(height: 300),
//         MaterialButton(
//             onPressed: () async {
//               DatabaseReference ref =
//                   FirebaseDatabase.instance.ref("users/123");
//               await ref.set({
//                 "name": "John",
//                 "age": 18,
//                 "address": {"line1": "100 Mountain View"}
//               });
//             },
//             child: Text('Loadad'),
//             color: Colors.yellow),
//         MaterialButton(
//             onPressed: () async {
//               // final Snapshot = FirebaseDatabase.instance.ref().child('users').get();

//               final ref = FirebaseDatabase.instance.ref();
//               final snapshot = await ref.child('users').get();
//               if (snapshot.exists) {
//                 print(snapshot.value);
//               } else {
//                 print('No data available.');
//               }
//             },
//             child: Text('showad'),
//             color: Colors.yellow)
//       ])),
//     );
//   }
// }
