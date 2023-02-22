// import 'package:bhoomi_seva/navbar.dart';
import 'package:bhoomi_seva/data/userdata.dart';
import 'package:bhoomi_seva/navbar.dart';
import 'package:bhoomi_seva/provider/googlelogin.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    // var backgroundColor2 = #F8FFF2;
    //var backgroundColor;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Colors.green[200],
      // backgroundColor: rgb(248,255,242);
      // backgroundColor: Color.fromRGBO(248, 255, 242, 0),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/Language1.png")),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
              height: 235,
              width: 235,
              child: Image.asset(
                "assets/Login1.png",
                fit: BoxFit.fill,
              )),
          const Padding(
            padding: EdgeInsets.only(top: 60, bottom: 10),
            child: Text(
              "Welcome to BHO🌎MI SEVA ",
              //  semanticsLabel: "Info about the app in 1-2 lines",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0, bottom: 65),
            child: Text(
              "To forget how to dig the earth and tend the soil is to forget ourselves.",
              //  semanticsLabel: "Info about the app in 1-2 lines",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: SvgPicture.asset("assets/tree.svg"),
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
                //backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0),
            onPressed: () async {
              await signInWithGoogle().then((value) {
                if (value.user != null) {
                  userName = value.user!.displayName.toString();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => const KisanRakshak()),
                      (route) => false);
                } else {
                  Fluttertoast.showToast(
                      msg: "Login Failed",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                }
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/Google1.png"),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  "Google Sign-in",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
