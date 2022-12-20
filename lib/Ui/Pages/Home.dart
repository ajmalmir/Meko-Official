import 'package:flutter/material.dart';
import 'package:meko/Firebase/Card.dart';
import 'package:meko/Ui/Pages/Wallet.dart';
import 'package:meko/Widgets/CircleButton.dart';

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
// ! AppBar---------------------------------------------------------------------
          appBar: AppBar(
            toolbarHeight: 60,
            title: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WalletPage(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.currency_rupee_outlined,
                          color: Colors.black,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.wallet,
                                  color: Colors.black,
                                  size: 20,
                                ),
                                Text(
                                  'Wallet',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              '400',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.grey[200],
          ),
          body: Container(
            child: ListView(children: [
// !  Container 1 -----------------------------------------------{Started}------
              Container(
                height: 20,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
// !  Trending & View all -----------------------------------------------{Started}------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
// !  Container 2 -----------------------------------------------{Started}------
              Container(
                height: 145,
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
                    height: 230,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
// Row 1------------------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // * 1------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Share & Earn',
                              ),
                              // * 2------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Task',
                              ),
                              // * 3------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Watch & Earn',
                              ),
                              // * 4------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Scratch',
                              ),
                            ],
                          ),
                        ),
// Row 1'-----------------------------------------------------------------------
// Row 1------------------------------------------------------------------------
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // * 1------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Share & Earn',
                              ),
                              // * 2------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Task',
                              ),
                              // * 3------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Watch & Earn',
                              ),
                              // * 4------------------------------------------
                              CircleButton(
                                icon: Icons.person,
                                text: 'Scratch',
                              ),
                            ],
                          ),
                        ),
// Row 1'-----------------------------------------------------------------------
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
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Icon(Icons.keyboard_arrow_right_sharp),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            ]),
          )),
    );
  }
}
