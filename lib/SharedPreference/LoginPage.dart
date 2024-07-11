import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/SharedPreference/HomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(){
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
    home: LoginSharedPage(),
  ));
}

class LoginSharedPage extends StatefulWidget {
  const LoginSharedPage({super.key});

  @override
  State<LoginSharedPage> createState() => _LoginSharedPageState();
}

class _LoginSharedPageState extends State<LoginSharedPage> {

  late SharedPreferences data;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  late bool newuser;

  @override
  void initState() {
    checkUser();
    super.initState();
  }
//function to check wether the user is already signed in or not ,if false login successful while clicking the login button
  void checkUser() async {
    data = await SharedPreferences.getInstance();
    newuser = (data.getBool('newuser') ?? true);
    if (newuser == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeLogin()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.facebook, size: 70, color: Colors.blue,),
            SizedBox(height: 50,),

            TextFormField(
              controller: username,
              decoration: InputDecoration(

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                hintText: 'username',

                prefixIcon: Icon(Icons.person),

              ),

            ),
            SizedBox(height: 18,),
            TextFormField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Password',
                prefixIcon: Icon(Icons.lock),

              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              String uName = username.text;
              String pWord = password.text;

              if (uName != '' && pWord != '') {
                //print("Login successful");

                data.setString('username', uName);
                data.setBool('newuser', false);

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeLogin()));
              }
            }, child: Text("Login"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, minimumSize: Size(300, 50)
              ),),
          ],
        ),
      ),
    );
  }

}
