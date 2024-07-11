import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/SharedPreference2/dummyData.dart';
import 'package:flutter_shared_preference/SharedPreference2/loginPage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageReg extends StatefulWidget {
  const HomePageReg({super.key});

  @override
  State<HomePageReg> createState() => _HomePageRegState();
}

class _HomePageRegState extends State<HomePageReg> {

  late SharedPreferences data1;

   String ? NameOfUser;

  @override
  void initState() {
    GetName();
    super.initState();
  }



  void GetName() async{

    data1=await SharedPreferences.getInstance();
    NameOfUser =data1.getString('name')!;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        leading: CircleAvatar(backgroundImage: AssetImage(""),
        ),
title:  Text("  $NameOfUser",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(icon:Icon(Icons.logout), onPressed: () {  data1.setBool('newuser', true);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPageRegister()));
    },
              ),
        ],
      ),

      // body: ListView(
      //     children:
      //     dummyProducts.map((product) => GestureDetector(
      //       child: Center(
      //         child: Column(
      //           children: [
      //
      //             Image(image: AssetImage("${product['image']}")),
      //             Text("${product['name']}"),
      //           ],
      //         ),
      //       ),
      //       onTap: ()=>getproduct(context,product['id']),
      //     )).toList()
      //
      // ),
      body: GridView( 
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      children: dummyProducts.map((product) => GestureDetector(
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
          margin: EdgeInsets.all(10),
          child: Image(image: AssetImage("${product['image']}"),),
        ),
        onTap: ()=>getproduct(context, product['id']),
      ),
      ).toList()
      ),

    );
  }

  getproduct(BuildContext context, product) {

    Navigator.pushNamed(context, 'productdetailspage',arguments: product);
  }
}
