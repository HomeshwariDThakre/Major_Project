import 'package:flutter/cupertino.dart'; //code deleted which were not in use
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TeamInfoState();
  }
}

class TeamInfoState extends State<TeamInfo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        //backgroundColor: const Color(0xFFFEFBEA)
        body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: GradientColors.februaryInk,
      )),
      child: SingleChildScrollView(
          child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                  ],
                ))
          ])),
    ));
  }
}
