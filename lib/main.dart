import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:meko/Services/AuthService.dart';
import 'package:meko/firebase_options.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ;
  Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  // var wallet = await Hive.openBox('Wallet');
  // var email = await Hive.openBox('email');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MEKO',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: AuthService().handleAuthState(),
    );
  }
}
