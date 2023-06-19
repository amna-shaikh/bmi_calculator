import 'package:bmi_calculator/task2/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {

   final User? user = FirebaseAuth.instance.currentUser!;
 // late User _currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar:AppBar(
          title: Text("Hell0"),
          actions: [
            IconButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> loginPage()));
            }, icon: Icon(Icons.logout_outlined))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(user?.photoURL ?? "https://assets.stickpng.com/images/585e4bf3cb11b227491c339a.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(user?.displayName ?? ""),

              Text("Email : ${user?.email ?? " "}")

            ],
          ),
        ),
      ),
    );
  }
}
