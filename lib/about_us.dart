import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import 'teaminfo.dart';

class AboutUs extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return AboutUsState();
  }
}

class AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            width: width,
            decoration: const BoxDecoration(
              color: Colors.green,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircleAvatar(
                    radius: 80,
                    foregroundColor: Colors.green,
                    backgroundImage: AssetImage('assets/kisan_helper.jpg'),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Contact Us',
                  style: GoogleFonts.varelaRound(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),

          // Padding(
          //     padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
          //     child: Card(
          //         elevation: 5,
          //         child: Padding(
          //           padding: const EdgeInsets.all(10),
          //           child: Text(
          //             'Recently we have observed the emerging concept of smart farming that makes agriculture more efficient and effective with the help of high-precision algorithms.Our App allows the users to estimate whether the use of pesticides will damage their crop or not . This app also gives user important information like the weather , soil types and tips for good farming . ',
          //             style: GoogleFonts.poppins(
          //                 fontSize: 16, color: Colors.black),
          //             textAlign: TextAlign.center,
          //           ),
          //         ))),
          // const SizedBox(
          //   height: 10,
          // ),
          // const SizedBox(
          //   height: 60,
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(15),
          //   child: Align(
          //     alignment: Alignment.bottomRight,
          //     child: GestureDetector(
          //       onTap: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => TeamInfo()));
          //       },
          //       child: Container(
          //         height: 70,
          //         width: 70,
          //         decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(35),
          //             image: const DecorationImage(
          //                 image: AssetImage('assets/titans.jpeg'))),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void _launchemailURL(String url1) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: url1,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }
}
