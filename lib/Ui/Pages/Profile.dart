import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meko/Ui/Pages/Account.dart';
import 'package:meko/Ui/Pages/Help.dart';
import 'package:meko/Ui/Pages/Refer.dart';
import 'package:meko/Ui/Pages/Scratch.dart';
import 'package:meko/Ui/Pages/Wallet.dart';
import 'package:meko/Widgets/SizeBox.dart';

class ProfilePage extends StatelessWidget {
  Widget listTile({
    IconData? icon,
    String? title,
  }) {
    return Column(
      children: [
        Divider(),
        ListTile(
          leading: Icon(
            icon,
            color: Colors.black,
          ),
          title: Text(
            title!,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 15,
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.grey),
        backgroundColor: Colors.grey,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              height: 110,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 47,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          FirebaseAuth.instance.currentUser!.photoURL!),
                      radius: 45,
                    ),
                  ),
                  adh(10),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 80,
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  FirebaseAuth.instance.currentUser!.email!,
                                  style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  FirebaseAuth
                                      .instance.currentUser!.displayName!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ]),
                    ),
                    adw(70),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountPage()));
                      },
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black,
                            child: CircleAvatar(
                                child: Icon(
                                  Icons.edit,
                                  size: 17,
                                  color: Colors.black,
                                ),
                                radius: 13,
                                backgroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // !listTiles---------------------------My Account ---------------------

                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AccountPage(),
                      )),
                  child: listTile(
                      icon: Icons.account_balance_rounded, title: "My Account"),
                ),
                // !listTiles---------------------------My Wallet ---------------------

                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WalletPage(),
                      )),
                  child:
                      listTile(icon: Icons.wallet_rounded, title: "My Wallet"),
                ),

                // ! Listtiles ----------------------------------Contact us
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => scratch(),
                      )),
                  child: listTile(
                      icon: Icons.contact_phone_rounded, title: "Contact Us"),
                ),

                // !listTiles-------------------------privacy-----------------------
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ReferPage(),
                      )),
                  child: listTile(
                      icon: Icons.privacy_tip_outlined,
                      title: "Privacy Policy"),
                ),

                // !listTiles-------------------------Help us-----------------------
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpPage(),
                      )),
                  child: listTile(icon: Icons.help_center, title: "Help"),
                ),

                // !listTiles-------------------logout-----------------------------
                GestureDetector(
                    onTap: () {
                      GoogleSignIn().signOut();
                      FirebaseAuth.instance.signOut();
                    },
                    child: listTile(
                        icon: Icons.door_sliding_outlined, title: "Logout")),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
