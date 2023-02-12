import 'package:Bhoomi_Seva/navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset("assets/Language.png")),
            SizedBox(height: 40,),
          Image.asset("assets/Login.png"),
          Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 50),
            child: Text("Welcome to Bho🌎mi Seva", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),),
          ),
          // CircleAvatar(
          //   backgroundColor: Colors.white,
          //   child: SvgPicture.asset("assets/tree.svg"),
          // ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => KisanRakshak()));
            },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/Google.png"),
              SizedBox(width: 10,),
              Text("Google Sign-in", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
            ],
          ),),
        ],
      ),
    );
  }
}