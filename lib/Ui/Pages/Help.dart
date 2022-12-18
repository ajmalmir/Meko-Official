import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meko/Widgets/SizeBox.dart';

class HelpPage extends StatefulWidget {
  HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  final postcont = TextEditingController();

  bool loading = false;

  final databaseRef = FirebaseDatabase.instance.ref('post');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
        color: Colors.black,
      )),
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        TextFormField(
          // validator: (value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please enter some text';
          //   }
          //   return null;
          // },
          controller: postcont,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              hintText: 'Gender',
              labelText: ' Gender'),
        ),
        adh(50),
        GestureDetector(
          onTap: (() {
            databaseRef.child('1').set({"aid": '1'});
          }),
          child: Container(
            height: 30,
            width: 100,
            color: Colors.green,
            child: Center(child: Text('SUBMIT')),
          ),
        )
      ]),
    );
  }
}
