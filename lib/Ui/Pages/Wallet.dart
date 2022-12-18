import 'package:flutter/material.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,

//! App Bar-----------------------------------------------{Started}-------------
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.grey,
            leading: BackButton(
              color: Colors.white,
            )),
//! App Bar--------------------------------------------------{Ends}-------------

        body: SingleChildScrollView(
          child: Column(
            children: [
              // ! First container---------------------------------------{Started}------------
              Container(
                height: 90,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Available Balance',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.currency_rupee,
                          color: Colors.white,
                          size: 30,
                        ),
                        Text(
                          '410',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )),
              ),

              // ! First container---------------------------------------{Ends}---------------

              Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Enter Payment Details',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        color: Colors.grey,
                        height: 5,
                        width: 50,
                      ),
                      Text(' 0 '),
                      Container(
                        color: Colors.grey,
                        height: 5,
                        width: 50,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Enter Paytm number',
                              labelText: 'Paytm '),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12)),
                              hintText: 'Enter Amount',
                              labelText: 'Amount'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(
                    color: Colors.grey,
                    child: Text(
                      'SUBMIT',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ],
          ),
        ));
  }
}
