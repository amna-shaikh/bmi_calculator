import 'package:bmi_calculator/auth/loginpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  TextEditingController weightcontroller = TextEditingController();
  TextEditingController heightcontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double bmi = 0.0 ;
  String bmiresult="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[500],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor:  Colors.indigo[500],
        title: Text("BMI"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () async{
            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn()));

          }, icon:Icon(Icons.logout, color: Colors.white70,))
        ],

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Hi"
              //  " ${user!.email}"
              , style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 25,
              color: Colors.white
            ),),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 10,
                child: Padding(padding: EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      TextFormField(
                        controller: heightcontroller,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration:const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter height in m',
                          //prefixIcon: Icon(Icons.trending_up) ,

                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter height';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      TextFormField(
                        controller: weightcontroller,
                        keyboardType: TextInputType.numberWithOptions(decimal: true),
                        decoration:const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Enter weight in kg',
                         // prefix: Icon(Icons.line_weight_sharp),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter weight';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigo[500],
                          foregroundColor: Colors.white,

                        ),
                        child: Text('Show Result', style: TextStyle(fontSize: 20),),
                        onPressed: (){
                          if (_formKey.currentState!.validate()) {
                          show();
                          }
                        },
                      ),
                      SizedBox(height: 10,),
                      Text("${bmi.toStringAsFixed(1)}", style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                      ),),
                      SizedBox(height: 10,),
                      Text("${bmiresult}", style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.indigo[900]
                      ),),

                    ],
                  ),
                ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
  void show(){
    var height = double.parse(heightcontroller.text);
    var weight = double.parse(weightcontroller.text);
    if(height == null || weight == null || height < 0 || weight < 0){
      setState(() {
        bmiresult = "Please enter positive number";
      });

    }
    else {
      setState(() {
        bmi = weight / (height * height);
        if (double.parse(bmi.toStringAsFixed(1)) > 0 && double.parse(bmi.toStringAsFixed(1)) < 18.5) {
          bmiresult = "You are underweight";
        }
       else if (double.parse(bmi.toStringAsFixed(1)) > 18.5 && double.parse(bmi.toStringAsFixed(1)) < 25) {
          bmiresult = "You are healthy!";
        }
       else if (double.parse(bmi.toStringAsFixed(1)) > 25 &&double.parse(bmi.toStringAsFixed(1)) < 30) {
          bmiresult = "You are overweight!";
        }
        else {
          bmiresult = "You are obese";
        }
      });
    }


  }
}
