import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meko/Widgets/SizeBox.dart';

class AccountPage extends StatefulWidget {
  AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // ! Global Key--------------------------------------
  final _formKey = GlobalKey<FormState>();
  // !TextEditingControllers--------------------------
  var namecont = TextEditingController();
  var emailcont = TextEditingController();
  var phonecont = TextEditingController();
  var agecont = TextEditingController();
  var gendrcont = TextEditingController();
  var refferalcont = TextEditingController();

  late DatabaseReference dbref;
  @override
  Widget build(BuildContext context) {
    // dbref = FirebaseDatabase.instance.ref().child('users');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Account Details',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                      adh(20)
                    ],
                  ),
                ),
              ),
              adh(20),
              // ! Full-Name--------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  controller: namecont,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter Full Name',
                      labelText: 'Full Name'),
                ),
              ),
              // ! Email--------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: emailcont,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter Email',
                      labelText: 'Email'),
                ),
              ),
              // ! Phone No--------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: phonecont,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.phone_callback_outlined,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter Phone',
                      labelText: 'Phone no'),
                ),
              ),

              // ! Age--------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: agecont,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Enter Age',
                      labelText: 'Age(Year of)'),
                ),
              ),

              // ! Gender--------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: gendrcont,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.transcribe,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Gender',
                      labelText: ' Gender'),
                ),
              ),
              // ! Referal code--------------------------------------------------
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  controller: refferalcont,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.copy_all_outlined,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      hintText: 'Referal Code',
                      labelText: 'Referal Code'),
                ),
              ),

              adh(30),
              Container(
                height: 40,
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      var emi =
                          FirebaseAuth.instance.currentUser!.email!.toString();
                      final splitted = emi.split('.');
                      final eni = splitted[0];

                      final ref =
                          FirebaseDatabase.instance.ref('users').child(eni);
                      ref.set({
                        'name': namecont.text.trim(),
                        ' email': namecont.text.trim(),
                        'phonenumber': namecont.text.trim(),
                        'age': namecont.text.trim(),
                        'refferedby': namecont.text.trim()
                      });
                      ScaffoldMessenger(
                          child: SnackBar(content: Text('profile updated')));
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
