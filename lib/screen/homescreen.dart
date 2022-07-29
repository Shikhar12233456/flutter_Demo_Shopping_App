import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/model/products.dart';
import 'package:flutter_login/model/user_model.dart';
import 'package:flutter_login/screen/productPage.dart';
import 'package:flutter_login/utils/MyDrawer.dart';

class homescreen extends StatefulWidget {
  homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => homescreenState();
}

class homescreenState extends State<homescreen> {
  User? user = FirebaseAuth.instance.currentUser;
  Usermodel loguser = Usermodel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      loguser = Usermodel.fromMap(value.data());
      setState(() {});
    });
    loadJson();
  }

  loadJson() async {
    var catJson = await rootBundle.loadString("assets/JSON/prod.json");
    var decode = jsonDecode(catJson);
    var productData = decode["products"];
    ProductModel.items = List.from(productData)
        .map<product>((item) => product.fromMap(item))
        .toList();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Food Wallah"),
        titleTextStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:ListView.builder(
              itemCount: ProductModel.items.length,
              itemBuilder: (context, index) {
                product prd = ProductModel.items[index];
                if (ProductModel.items.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                    child: Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>productPage(prd)));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              prd.imageUrl,
                              height: 60,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  prd.name,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                ),
                                Text(
                                  "${prd.price}",
                                  style: const TextStyle(
                                      color: Colors.amber,
                                      fontSize: 12,
                                      fontStyle: FontStyle.italic),
                                )
                              ],
                            ),
                            Text(prd.descr),
                            ElevatedButton(
                              onPressed: (){
                                
                              },  
                            child: Text("${prd.price}",style: const TextStyle(color: Colors.amber),),)
                          ],
                        ),
                      ),
                    ),
                  );
                }
                else{
                  return Column(
                    children: const[
                      Text("No elements",style: TextStyle(color: Colors.redAccent),),
                    ],
                    );
                }
              }),
      ),
      drawer: MyDrawer(),
    );
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
