
import 'package:bmi_calculator/auth/Signup.dart';
import 'package:bmi_calculator/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);
  @override
  State<SignIn> createState() => _SignInState();
}
class _SignInState extends State<SignIn> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future signin() async {
    try {
     final UserCredential user =  await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text,
      );
      if(user  != null)

       {
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
       }
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
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
         backgroundColor: Colors.indigo[500],
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 50),
                child: Center(
                  child: const Text("BMI" , style: TextStyle(
                    fontSize: 30 ,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),),

                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white70 ,
                  shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0) ,
                        topLeft: Radius.circular(30.0)),
                    /*image: DecorationImage(
                      image: AssetImage("assets/images.png"),
                      fit: BoxFit.cover,
                    ),*/
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
          const Text("Welcome", style: TextStyle(
                fontSize: 25 ,
                fontWeight: FontWeight.bold,
                color: Colors.black
          )),
          SizedBox(height: 10,),
          const Text("Login to your account", style: TextStyle(
              fontSize: 20 ,
              fontWeight: FontWeight.bold,
              color: Colors.grey
          )),

        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            controller: emailcontroller,
            decoration:const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              hintText: 'Enter Your Email',
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
           padding: const EdgeInsets.symmetric(vertical: 8),
           child: TextFormField(
            controller:passcontroller ,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
              hintText: 'Enter Password',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter password';
              }
              return null;
            },
        ),
         ),

        ElevatedButton(
        style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo[500],
        foregroundColor: Colors.white,
        ),
        child: Text('Login', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
        onPressed: (){
          if (_formKey.currentState!.validate()) {
            signin();
          }
        },
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUp()));
              }, child:Text("Create account", style: TextStyle(
                    fontSize: 15 ,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue
              )), )
            ],
          ),
        ],
        )),
                  ),
                  ),
              ),
            ],
          ),


    );
  }
}
