import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meko/Ui/Screens/Auth.dart';
import 'package:meko/Ui/Pages/Home.dart';

class SplashService {


  void isLogin(BuildContext context) {
    // final auth = FirebaseAuth.instance;
    final auth = FirebaseAuth.instance.authStateChanges();

    // ignore: unnecessary_null_comparison
    if (auth != null) {
      Timer(Duration(seconds: 4), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AuthScreen(),
            ));
      });
    } else
      Timer(Duration(seconds: 4), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ));
      });
  }
}

// AuthService().handleAuthState()