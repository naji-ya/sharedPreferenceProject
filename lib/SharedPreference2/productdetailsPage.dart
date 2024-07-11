import 'package:flutter/material.dart';
import 'package:flutter_shared_preference/SharedPreference2/dummyData.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  double value = 3.5;
  @override
  Widget build(BuildContext context) {
    final id=ModalRoute.of(context)?.settings.arguments;
    final product = dummyProducts.firstWhere((productsused) => productsused["id"]==id);
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Image(image: AssetImage(product["image"]),
            ),
          ),

          Text(product["name"],style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          SizedBox(
            height: 25,
          ),
          Text(product["price"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
          Text(product["description"],
            style: TextStyle(
                fontSize: 20
            ),),
        ],
      ),
    );
  }
}
