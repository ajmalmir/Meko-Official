import 'package:flutter/material.dart';
import 'package:meko/Firebase/Card.dart';
import 'package:meko/Ui/Pages/Wallet.dart';
import 'package:meko/Ui/Screens/Watch.dart';
import 'package:meko/Utils/Square.dart';

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
            title: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // SizedBox(
                      //   width: 20,
                      // ),
                      Icon(
                        Icons.currency_rupee_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Current Balance',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '400',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WalletPage(),
                          )),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wallet',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.wallet,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      )),
                  // SizedBox(
                  //   width: 20,
                  // )
                ],
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.grey,
          ),
          body: Container(
            child: ListView(children: [
              // !  Container 1 -----------------------------------------------{Started}------
              Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              // !  Trending & View all -----------------------------------------------{Started}------
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
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
                // 160
                height: 160,
                child: CardUtil(),
              ),
              // ! Row Container 1 -----------------------------------------------{Started}------

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Container(
                  // 110
                  height: 110,
                  child: SquareUtil(),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // !  Container 4 -----------------------------------------------{Started}------

              Container(
                height: 160,
                child: ContainerUtil(),
              ),
            ]),
          )),
    );
  }
}
