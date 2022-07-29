import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/model/user_model.dart';
import 'package:flutter_login/screen/homescreen.dart';
import 'package:flutter_login/screen/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final firstnameEditingController = new TextEditingController();
  final secondnameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passEditingController = new TextEditingController();
  final confpassEditingController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firstname = TextFormField(
      autofocus: false,
      controller: firstnameEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("First NAme cann't be empty");
        }
        return null;
      },
      onSaved: (newValue) {
        firstnameEditingController.text = newValue!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
    );

    final secondName = TextFormField(
      autofocus: false,
      controller: secondnameEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Second NAme cann't be empty");
        }
        return null;
      },
      onSaved: (newValue) {
        secondnameEditingController.text = newValue!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.person),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Second Name",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
    );

    final emailField = TextFormField(
      autofocus: false,
      controller: emailEditingController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter your Email");
        }

        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Plaease Enter valid email");
        }

        return null;
      },
      onSaved: (newValue) {
        emailEditingController.text = newValue!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
    );

    final passWordField = TextFormField(
      autofocus: false,
      controller: passEditingController,
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: (value) {
        RegExp regex = new RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
        if (value!.isEmpty) {
          return ("Please enter your password");
        }
        if (!regex.hasMatch(value)) {
          return ("please enter valid password ");
        }
        return null;
      },
      onSaved: (newValue) {
        passEditingController.text = newValue!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.vpn_key),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
    );

    final confpassWordField = TextFormField(
      autofocus: false,
      controller: confpassEditingController,
      keyboardType: TextInputType.text,
      validator: (value) {
        if (passEditingController.text != value) {
          return ("Password Not Matching");
        }
        return null;
      },
      onSaved: (newValue) {
        confpassEditingController.text = newValue!;
      },
      textInputAction: TextInputAction.done,
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.lock),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Confirm Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )),
    );

    final SignupButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      color: Colors.redAccent,
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        onPressed: () {
          SignUp(emailEditingController.text, passEditingController.text);
        },
        minWidth: MediaQuery.of(context).size.width,
        child: const Text(
          "SignUp",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  firstname,
                  const SizedBox(
                    height: 15,
                  ),
                  secondName,
                  const SizedBox(
                    height: 15,
                  ),
                  emailField,
                  const SizedBox(
                    height: 15,
                  ),
                  passWordField,
                  const SizedBox(
                    height: 15,
                  ),
                  confpassWordField,
                  const SizedBox(
                    height: 15,
                  ),
                  SignupButton,
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Already an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }

  void SignUp(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: "Error");
      });
    }
  }

  postDetailsFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    Usermodel usermodel = Usermodel();
    usermodel.email = user!.email;
    usermodel.uid = user.uid;
    usermodel.firstName = firstnameEditingController.text;
    usermodel.secondName = secondnameEditingController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(usermodel.toMap());

    Fluttertoast.showToast(msg: "Account Created Successfully");
    Navigator.pushAndRemoveUntil(
        (context),
        MaterialPageRoute(builder: (context) => homescreen()),
        (route) => false);
  }
}
