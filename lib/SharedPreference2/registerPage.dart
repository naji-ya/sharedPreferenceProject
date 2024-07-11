import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/SharedPreference2/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // create data1 as the obj of sharedpreference

  late SharedPreferences data1;

  // declare the text editing controllers

  TextEditingController name = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  late bool newuser;

  @override
  void dispose() {
    name.dispose();
    username.dispose();
    password.dispose();
    super.dispose();
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
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 38,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Create your account",
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
                    controller: name,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        )),
                  ),
                  SizedBox(
                    height: 10,
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
register();
                    },
                    child: Text(
                      "Register",
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
                        "Already have an account?",
                        style: TextStyle(fontSize: 17),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Login",
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

  void register() async{
    data1=await SharedPreferences.getInstance();
    String Name=name.text;
    String Uname=username.text;
    String Paswrd=password.text;

    if(Name !=''&& Uname !='' && Paswrd !=''){

      data1.setString('name', Name);
      data1.setString('username',Uname);
      data1.setString('password', Paswrd);

      Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPageRegister()));
    }


  }


}
