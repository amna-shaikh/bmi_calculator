
import 'package:bmi_calculator/auth/loginpage.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> SignIn()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/splash.png"),
            SizedBox(height: 30,),
              CircularProgressIndicator(
                color: Colors.white70,
              )

          ],
        ),
      ),
    );




    /*AnimatedSplashScreen(
      splash:AssetImage("assets/images.png"),
      //Lottie.network("https://assets2.lottiefiles.com/packages/lf20_3ejhEJ/over/data.json",),
      nextScreen: SignIn() ,
      backgroundColor: Colors.indigo[500]!,
      splashIconSize: 800,
      duration: 5000,
      splashTransition: SplashTransition.sizeTransition,
      animationDuration: Duration(seconds: 2),

    );*/




















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
