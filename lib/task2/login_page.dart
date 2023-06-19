import 'package:bmi_calculator/task2/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'helper.dart';
import 'mainPage.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose(){
    super.dispose();
    emailcontroller.dispose();
   passcontroller.dispose();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black87,
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  Padding(
              padding: EdgeInsets.symmetric(vertical: 40 , horizontal: 20),
            child: Text("Welcome" , style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Colors.white
            ),),
            ),
           const  SizedBox(height: 5,),

      const Padding(
        padding: EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
        child: Text("Login to your Account",  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
      ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                controller: emailcontroller,
                decoration:const InputDecoration(
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                  color: Colors.white,
                ),
                  hintText: 'Enter Your Email',
                  hintStyle: TextStyle(
                  color: Colors.white,
                )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10 , horizontal: 20),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
                textCapitalization: TextCapitalization.sentences,
                controller:passcontroller ,
                obscureText: true,
                decoration: const InputDecoration(
                  focusColor: Colors.yellow,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 3, color: Colors.white),
                  ),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  hintText: 'Enter Password',
                  hintStyle:TextStyle(
                  color: Colors.white,
                )
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter password';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 10,),
            Padding(padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 50),

            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  elevation: 0.0,
                    fixedSize: const Size(350, 50)
                ),
                onPressed: ()  {
                  if (_formKey.currentState!.validate()) {
                    Login(emailcontroller.text , passcontroller.text , context);
                  }
                 //await  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                }, child: const Text("Login" , style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.white
            ),),),


            ),
             const SizedBox(height: 10,),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12 , horizontal: 50),
                child: SignInButton(
                  Buttons.google,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  onPressed: () async {
                    try {
                      final GoogleSignIn _googleSignIn = GoogleSignIn(
                        scopes: ['email'],
                      );
                      final FirebaseAuth _auth = FirebaseAuth.instance;

                      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
                      final GoogleSignInAuthentication? googleAuth =
                      await googleUser?.authentication;

                      final AuthCredential credential = GoogleAuthProvider.credential(
                        accessToken: googleAuth?.accessToken,
                        idToken: googleAuth?.idToken,
                      );

                     final User? user = (await _auth.signInWithCredential(credential)).user;
                      // print("signed in " + user.displayName);
                    } catch (e) {


                    }
                    await  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
                                      },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have account?", style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey
                )),
                TextButton(onPressed: (){
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => signUpPage()) );
                }, child:Text("Create account", style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue
                )), )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

