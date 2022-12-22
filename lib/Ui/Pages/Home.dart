import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meko/Firebase/Card.dart';
import 'package:meko/Ui/Pages/Profile.dart';
import 'package:meko/Ui/Pages/Wallet.dart';
import 'package:meko/Utils/LongContainer.dart';
import 'package:meko/Widgets/CircleButton.dart';
import 'package:meko/Widgets/SizeBox.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: ListView(children: [
// !  Container 1 -----------------------------------------------{Started}------
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // ! Wallet---
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WalletPage(),
                                  ));
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.white),
                              child: Center(
                                  child: FaIcon(
                                FontAwesomeIcons.wallet,
                                color: Colors.black,
                              )),
                            ),
                          ),
                          adw(10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Balance',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                              adh(2),
                              Text(
                                '₹500',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.green),
                              ),
                            ],
                          )
                        ],
                      ),
                      // ! Profile
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white),
                          child: Center(
                              child: FaIcon(FontAwesomeIcons.userAstronaut)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              adh(10),

              Container(
                height: 200,
                child: CardUtil(),
              ),

              // ! Row Container 1 -----------------------------------------------{Started}------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
// Row 1------------------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ! 1------------------------------------------
                              CircleButton(
                                text: 'Scratch &\n Earn',
                                onTap: () {
                                  
                                },
                                img: 'images/trophy.png',
                              ),
                              // ! 2------------------------------------------
                              CircleButton(
                                text: 'Task\n ',
                                onTap: () {},
                                img: 'images/task.png',
                              ),
                              // ! 3------------------------------------------
                              CircleButton(
                                text: ' Watch &\n  Earn',
                                onTap: () {},
                                img: 'images/play.png',
                              ),
                              // ! 4------------------------------------------
                              CircleButton(
                                text: 'Spin &\n Earn',
                                onTap: () {},
                                img: 'images/spin.png',
                              ),
                            ],
                          ),
                        ),

// Container------------------------------------1-1
                        Container(
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Colors.amber),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Watch & Earn',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_right_sharp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),

// !  Container 2 -----------------------------------------------{Started}------

              Container(
                child: LongContainer(
                  img: 'images/gift-box.png',
                  price: '50,00.0',
                  txt: 'Demart Account',
                ),
              ),
              adh(15),

              Container(
                child: LongContainer(
                  img: 'images/gift-box.png',
                  price: '100,00.00',
                  txt: 'Crypto',
                ),
              ),
              adh(15),

              Container(
                child: LongContainer(
                  img: 'images/gift-box.png',
                  price: '100,00.00',
                  txt: 'Personal Loan',
                ),
              ),
              // ! Row Container 1 -----------------------------------------------{Started}------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // ! 1------------------------------------------
                              CircleButton(
                                text: 'Refer \n ',
                                onTap: () {},
                                img: 'images/gift-box.png',
                              ),
                              // ! 2------------------------------------------
                              CircleButton(
                                text: 'Task\n ',
                                onTap: () {},
                                img: 'images/task.png',
                              ),
                              // ! 3------------------------------------------
                              CircleButton(
                                text: ' Watch &\n  Earn',
                                onTap: () {},
                                img: 'images/play.png',
                              ),
                              // ! 4------------------------------------------
                              CircleButton(
                                text: 'Spin &\n Earn',
                                onTap: () {},
                                img: 'images/spin.png',
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                              color: Colors.amber),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Refer & Earn',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_right_sharp),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ]),
          )),
    );
  }
}
