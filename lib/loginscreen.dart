// import 'package:bhoomi_seva/navbar.dart';
import 'package:bhoomi_seva/classes/language.dart';
import 'package:bhoomi_seva/classes/language_constants.dart';
import 'package:bhoomi_seva/data/userdata.dart';
import 'package:bhoomi_seva/main.dart';
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
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  // void _showSuccessDialog() {
  //   showTimePicker(context: context, initialTime: TimeOfDay.now());
  // }

  @override
  Widget build(BuildContext context) {
    // var backgroundColor2 = #F8FFF2;
    //var backgroundColor;
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: const Color(0xffFBEAFF),
      // back groundColor: rgb(248,255,242);
      // backgroundColor: Color.fromRGBO(248, 255, 242, 0),
      appBar: AppBar(
        title: Text(translation(context).loginscreen),
        backgroundColor: const Color(0xff845EC2),
        //       title: Text(AppLocalizations.of(context)!.bhoomiSeva), //idhar bhoomiseva nhi aayega n
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  await setLocale(language.languageCode)
                      .then((locale) => MyApp.setLocale(context, locale));
                  selectedLan = language.languageCode;
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      // drawer: Drawer(
      //   child: _drawerList(),
      // ),
      //     //),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    return Form(
        key: _key,
        child: Column(children: <Widget>[
          Container(
              margin: const EdgeInsets.fromLTRB(20, 45, 20, 20),
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/logo.png",
                fit: BoxFit.fill,
              )),
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 40, bottom: 75),
            child: Text(
              translation(context).welcome,
              // AppLocalizations.of(context)!.WELCOME\nTO\nBHO🌎MI SEVA
              //  semanticsLabel: "Info about the app in 1-2 lines",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 30,
                color: Color(0xff845EC2),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.only(top: 15, bottom: 50),
          //   child: Text(
          //     "Caring nature for Caring Life.",
          //     //  semanticsLabel: "Info about the app in 1-2 lines",
          //     textAlign: TextAlign.center,

          //     style: TextStyle(
          //         fontSize: 20,
          //         color: Color(0xff4E8397),
          //         fontWeight: FontWeight.w500),
          //   ),
          // ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: SvgPicture.asset("assets/tree.svg"),
          //  ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffFBEAFF),
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
                Text(
                  translation(context).google,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ]));
  }

  // _drawerList() {}

  // translation(BuildContext context) {}
}
