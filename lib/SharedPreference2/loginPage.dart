

import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/SharedPreference2/productdetailsPage.dart';
import 'package:flutter_shared_preference/SharedPreference2/registerPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
void main() {
  runApp(MaterialApp(
    routes:{
      'productdetailspage':(context)=>ProductDetailsPage(),
    },
    debugShowCheckedModeBanner: false,
    home:LoginPageRegister (),
  ));
}

class LoginPageRegister extends StatefulWidget {
  const LoginPageRegister({super.key});

  @override
  State<LoginPageRegister> createState() => _LoginPageRegisterState();
}

class _LoginPageRegisterState extends State<LoginPageRegister> {


  final username=TextEditingController();
  final password= TextEditingController();

  late SharedPreferences data1;

  late bool newuser;

  late String Usname;
  late String psword;
  late String name;

@override
  void initState() {
  CheckAlreadyLogin();
  getValue();

    super.initState();
  }

  void getValue()async {
  data1= await SharedPreferences.getInstance();
  setState(() {
   name = data1.getString('name')!;
   Usname = data1.getString('username')!;
   psword =data1.getString('password')!;
  });

  }


  void CheckAlreadyLogin()async {

  data1 = await SharedPreferences.getInstance();

  newuser = (data1.getBool('newuser') ??true);

  if( newuser=false){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageReg()));
  }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  color: Colors.blueGrey.shade900),
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Login  to your account",
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 30,
                  ),

                  TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {

String userName = username.text;
String Passwords =password.text;

if(userName!='' && Passwords !='' && userName==Usname &&  Passwords==psword){
  data1.setBool('newuser', false);

  Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageReg()));
}


                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        minimumSize: Size(350, 60),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                          },
                          child: Text(
                            "Register",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




}
