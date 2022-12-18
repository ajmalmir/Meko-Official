import 'package:flutter/material.dart';
import 'package:meko/Ui/Pages/Profile.dart';
import 'package:meko/Utils/Button.dart';

class ReferPage extends StatefulWidget {
  const ReferPage({super.key});

  @override
  State<ReferPage> createState() => _ReferPageState();
}

class _ReferPageState extends State<ReferPage> {
  @override
  Widget build(BuildContext context) {
    var singleChildScrollView = SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 45,
                ),
                Text(
                  'Refer a friend for a bonus',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 9,
                    child: Icon(
                      Icons.question_mark,
                      size: 15,
                    ),
                  ),
                )
              ],
            ),
          ),

          // !How much you earn-----------------------------------------------------------

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              children: [
                Text(
                  'Get a 15% reward commision and your friend receive a 100 starting bonus',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text("REH353HEFU"),
                        ],
                      ),
                      Container(
                        height: 40,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Share",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.exit_to_app),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // !Refering count countainer---------------------------------------------------
                SizedBox(
                  height: 25,
                ),
                Text(
                  'How much did I earn by reffering friends?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        height: 100,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '0',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Total Rewads',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.grey,
                            )),
                        height: 100,
                        width: 160,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              '0\$',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Total Earnings',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ButtonUtil(
                          textcolour: Colors.white,
                          backgroundColor: Colors.green,
                          bordercolor: Colors.white,
                          size: 50,
                          icon: Icons.favorite,
                          isIcon: true,
                          borderRadius: 12,
                          OnTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonUtil(
                          textcolour: Colors.white,
                          backgroundColor: Colors.blue,
                          bordercolor: Colors.white,
                          size: 50,
                          icon: Icons.facebook,
                          isIcon: true,
                          borderRadius: 12,
                          OnTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              )),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonUtil(
                            textcolour: Colors.white,
                            backgroundColor: Colors.black,
                            bordercolor: Colors.white,
                            size: 50,
                            icon: Icons.share,
                            isIcon: true,
                            borderRadius: 12,
                            OnTap: () => 
                            ('hello')
                            ),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          child: ButtonUtil(
                            textcolour: Colors.white,
                            backgroundColor: Colors.blue,
                            bordercolor: Colors.white,
                            size: 50,
                            icon: Icons.telegram,
                            isIcon: true,
                            borderRadius: 12,
                            OnTap: () async {
                              // Uri a = Uri.parse('www.youtube.com');
                              // if (await canLaunchUrl(a)) {
                              //   launchUrl(a);
                              // } else {
                              //   print("Not lucnched");
                              // }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.grey,
      ),
      body: singleChildScrollView,
    );
  }
}
