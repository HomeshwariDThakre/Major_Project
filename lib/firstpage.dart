// import 'package:bhoomi_seva/navbar.dart';
import 'package:bhoomi_seva/navbar.dart';
import 'package:bhoomi_seva/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//import 'package:google_sign_in/google_sign_in.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});
  @override
  State<FirstPage> createState() => _FirstPageState();
}

singin() async {
  GoogleSignIn _singIn = GoogleSignIn();
  try {
    var result = await _singIn.signIn();
    if (result == null) {
      return;
    }
    final userdata = await result.authentication;
    final credential = GoogleAuthProvider.credential(
        accessToken: userdata.accessToken, idToken: userdata.accessToken);
    final finalresult = await FirebaseAuth.instance
        .signInWithCredential(credential)
        .whenComplete(() => Weather());
  } catch (e) {
    print(e);
  }
}

class _FirstPageState extends State<FirstPage> {
  Future<void> singin() async {
    //Create an instance of firebase auth and google sign in
    FirebaseAuth auth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    //Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    //Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    //Create a new credentials
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    //Sign in the user wih the credentials
    final UserCredential userCredential =
        await auth.signInWithCredential(credential);

    // GoogleSignIn _singIn = GoogleSignIn();
    // try {
    //   var result = await _singIn.signIn();
    //   if (result == null) {
    //     return;
    //   }
    //   final userdata = await result.authentication;
    //   final credential = GoogleAuthProvider.credential(
    //       accessToken: userdata.accessToken, idToken: userdata.accessToken);
    //   final finalresult =
    //       await FirebaseAuth.instance.signInWithCredential(credential);
    //   print("Result $result");
    //   // var displayName;
    //   print(result.displayName);
    //   print(result.email);
    // } catch (e) {
    //   print(e);
    // }
  }

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
          Container(
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
              //await firebase_services().signInWithGoogle();
              //  signInWithGoogle();
              Navigator.of(context).push(
                  //  MaterialPageRoute(builder: (context) => Weather()));
                  MaterialPageRoute(builder: (context) => KisanRakshak()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/Google1.png"),
                const SizedBox(
                  width: 4,
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
  // signInWithGoogle() async {

  //   GoogleSignInAccount? googleUser= await GoogleSignIn.signIn();

  //   GoogleSignInAuthentication? googleAuth=await googleUser?.authentication;

  //   AuthCredential credential=GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken
  //     idToken: googleAuth?.idToken
  //   );
  //   UserCredential userCredential= await FirebaseAuth.instance.signInWithCredential(credential);
  //   print(userCredential.user.displayName)

  //  // FirebaseAuth.instance.signInWithCredential(credential)

  // }
}

firebase_services() async {}
