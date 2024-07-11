
import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/SharedPreference/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
// void main(){
//   runApp(MaterialApp(
//     home: HomeLogin(),
//   ));
// }
class HomeLogin extends StatefulWidget {
  const HomeLogin({super.key});

  @override
  State<HomeLogin> createState() => _HomeLoginState();
}

class _HomeLoginState extends State<HomeLogin> {
  late SharedPreferences data;
  late String username;


  @override
  void initState() {
 fetchHome();
    super.initState();
  }


  void fetchHome() async {
    data= await SharedPreferences.getInstance();
    setState(() {
      username=data.getString('username')!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text("Welcome Home $username",style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.bold,
            ),),

          ),

          SizedBox(
            height: 40,
          ),

          ElevatedButton(onPressed: (){
            data.setBool('newuser', true);
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginSharedPage()));
          }, child: Text("Logout"),
            style:ElevatedButton.styleFrom(backgroundColor: Colors.blue,minimumSize: Size(300, 50)
            ),),
        ],
      ),
    );
  }
}
