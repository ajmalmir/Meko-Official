// import 'package:firebase_auth/firebase_auth.dart';
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
