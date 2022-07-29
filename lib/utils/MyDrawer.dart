import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/model/user_model.dart';
import 'package:flutter_login/screen/homescreen.dart';
import 'package:flutter_login/screen/login.dart';
import 'package:flutter_login/screen/profile.dart';

class MyDrawer extends StatefulWidget {
  MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text(loguser.firstName.toString()),
              accountEmail: Text(loguser.email.toString()),
            ),
          ),
          ListTile(
            title: const Text("Profile"),
            leading: const Icon(Icons.person),
            iconColor: Colors.black,
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => profile()));
            },
          ),
          ListTile(
            title: const Text("Logout"),
            leading: const Icon(Icons.logout),
            iconColor: Colors.redAccent,
            onTap: () {
              signout();
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => Login(),
              ));
            },
          )
        ],
      ),
    );
  }

  Future<void> signout() async {
    await FirebaseAuth.instance.signOut();
  }
}
