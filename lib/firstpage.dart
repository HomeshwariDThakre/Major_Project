// import 'package:bhoomi_seva/navbar.dart';
import 'package:bhoomi_seva/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    final finalresult =
        await FirebaseAuth.instance.signInWithCredential(credential).whenComplete(() => Weather());
    
  } catch (e) {
    print(e);
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    // var backgroundColor2 = #F8FFF2;
    //var backgroundColor;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 255, 242, 1),
      // backgroundColor: rgb(248,255,242);
      // backgroundColor: Color.fromRGBO(248, 255, 242, 0),
      body: Column(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: Image.asset("assets/Language.png")),
          SizedBox(
            height: 50,
          ),
          Container(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/Login1.png",
                fit: BoxFit.fill,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Text(
              "Welcome to Bho🌎mi Seva",
              //  semanticsLabel: "Info about the app in 1-2 lines",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 50),
            child: Text(
              "Info about the app in 1-2 lines",
              //  semanticsLabel: "Info about the app in 1-2 lines",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
            ),
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: SvgPicture.asset("assets/tree.svg"),
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(248, 255, 242, 1),
                //backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0),
            onPressed: () async {
              await firebase_services().signInWithGoogle();
              //  signInWithGoogle();
              Navigator.of(context).push(
                  //  MaterialPageRoute(builder: (context) => Weather()));
                  MaterialPageRoute(builder: (context) => Weather()));
            },
            child: InkWell(
              onTap: ()=>singin(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/Google.png"),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Google Sign-in",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
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
