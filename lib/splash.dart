import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi_calculator/auth/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash:Lottie.network("https://assets2.lottiefiles.com/packages/lf20_3ejhEJ/over/data.json",),
      nextScreen: SignIn() ,
      backgroundColor: Colors.indigo[500]!,
      splashIconSize: 800,
      duration: 4000,
      splashTransition: SplashTransition.sizeTransition,
      animationDuration: Duration(milliseconds: 1000),

    );




















     /* AnimatedContainer(
      color: Colors.indigo[700],
            duration: Duration(microseconds: 1000),
            child: Container(
              child: Image.asset("assets/images.png")

              //Lottie.network("https://assets2.lottiefiles.com/packages/lf20_3ejhEJ/over/data.json",),
      ),
    );*/
  }
}
