import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/model/user_model.dart';
import 'package:flutter_login/screen/homescreen.dart';
import 'package:flutter_login/utils/MyDrawer.dart';

class profile extends StatefulWidget {
  profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => homescreen()));
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset('assets/images/myImage.png'),
            Text(loguser.firstName.toString()),
            Text(loguser.secondName.toString()),
            Text(loguser.email.toString()),
            Text(loguser.uid.toString())
          ],
        ),
      ),
    );
  }
}
