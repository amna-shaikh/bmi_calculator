

import 'package:bmi_calculator/task2/mainPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



Future Login(String email , String pass, BuildContext context) async {
  try {
    final UserCredential user =    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: pass,
    );
    if (user != null) {
      Navigator.of(context)
          .pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text("Username does not exist", style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w400
                ),),
              ),
            );
          });

    } else if (e.code == 'invalid-email') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text('INVALID USERNAME'),
              ),
            );
          });
    } else if (e.code == 'wrong-password') {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text('WRONG PASSWORD'),
              ),
            );
          });
    }
  }
}

Future createAccount(String email , String pass, BuildContext context) async {
  try {
    final UserCredential user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email:email,
      password: pass,
    );
    if (user != null) {
      Navigator.of(context)
          .pushReplacement(
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
   //await Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }
  on FirebaseAuthException catch (e){
    if (e.code == 'email-already-in-use'){
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content: Container(
                child: Text('Email Already exist'),
              ),
            );
          });
    }
  }
}

_googleSignUp() async {

}
