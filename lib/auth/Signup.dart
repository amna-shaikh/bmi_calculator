
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../home.dart';
import 'loginpage.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  @override
  State<SignUp> createState() => _SignUpState();
}
class _SignUpState extends State<SignUp> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
Future SignUp() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailcontroller.text,
      password: passcontroller.text,
    );
<<<<<<< HEAD
    if(userCredential  != null)
=======
     if(userCredential  != null)
>>>>>>> origin/master
    {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
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
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.indigo[500],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
              decoration: const BoxDecoration(color: Colors.white70 ,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(25.0) ,
                      topLeft: Radius.circular(25.0))
              ),
              child:Padding(
                padding: const EdgeInsets.all(15),
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
                        const Text("Create Account", style: TextStyle(
                            fontSize: 15 ,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey
                        )),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child:TextFormField(
                            controller: emailcontroller,
                            decoration: InputDecoration(
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
                          padding: EdgeInsets.symmetric(vertical: 8),
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
                          child: Text('Create Account', style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),),
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                             SignUp();
                            }
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Already have account?", style: TextStyle(
                                fontSize: 15 ,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey
                            )),
                            TextButton(onPressed: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn()));
                            }, child:Text("Login", style: TextStyle(
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
