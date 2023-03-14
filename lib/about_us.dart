import 'package:bhoomi_seva/classes/language_constants.dart';
import 'package:bhoomi_seva/loginscreen.dart';
import 'package:bhoomi_seva/provider/googlelogin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<StatefulWidget> createState() => AboutUsState();
}

class AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // var color;
    return Scaffold(
      backgroundColor: const Color(0xffFEF6FF),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Titlebar(width: width),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              translation(context).contactus,
              style: GoogleFonts.poppins(fontSize: 22, color: Colors.black),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.email,
                  color: Colors.green,
                ),
                Text(
                  translation(context).email,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
                InkWell(
                  onTap: () async {
                    _launchemailURL('kisan.rakshak@gov.in');
                    setState(() {});
                  },
                  child: const Text(
                    ' kisan.rakshak@gov.in',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Text(
              translation(context).importanthelplines,
              style: GoogleFonts.poppins(fontSize: 22, color: Colors.black),
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                Text(
                  translation(context).bhoomihelplinenumber,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
                InkWell(
                  onTap: () => launchUrl(Uri(host: "tel://1800-180-1551")),
                  child: const Text(
                    '1800-180-1551',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                Text(
                  translation(context).nationalhelpline,
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
                InkWell(
                  onTap: () => launchUrlString("tel://1800-120-4049"),
                  child: const Text(
                    '1800-120-4049',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Row(
              children: [
                const Icon(
                  Icons.phone,
                  color: Colors.green,
                ),
                Text(
                  "Selected",
                  style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                ),
                InkWell(
                  onTap: () => launchUrlString("tel://1800-120-4049"),
                  child: const Text(
                    '1800-120-4049',
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                        fontSize: 17),
                  ),
                ),
              ],
            ),
          ),
          //  Padding(
          //      padding: const EdgeInsets.fromLTRB(10, 0,0,10),
          //      child: Card(
          //        elevation: 5,
          //          child: Padding(
          //              padding: const EdgeInsets.all(10),
          //              child: Text('Recently we have observed the emerging concept of smart farming that makes agriculture more efficient and effective with the help of high-precision algorithms.Our App allows the users to estimate whether the use of pesticides will damage their crop or not . This app also gives user important information like the weather , soil types and tips for good farming . ',style: GoogleFonts.poppins(fontSize:16,color: Colors.black),textAlign: TextAlign.center,),))),
          // // const SizedBox(height: 10,),'

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
          //         height: 65,
          //         width: 65,
          //         decoration: BoxDecoration(
          //             color: Colors.black,
          //             borderRadius: BorderRadius.circular(35),
          //             image: const DecorationImage(
          //                 image: AssetImage('assets/tm_logo29.png'))),
          //       ),
          //     ),
          //   ),
          // ),
          const Spacer(),
          SizedBox(
            child: Center(
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(fixedSize: Size(width - 50, 50)),
                onPressed: () async {
                  await logOut().whenComplete(() =>
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const LoginScreen()),
                          (route) => false));
                },
                child: Text(translation(context).logout),
              ),
              // const SizedBox(
              //   height: 35,
              // )
              //  height: 35,
            ),
          ),
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
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      // print('Could not launch $url');
    }
  }
}

class Titlebar extends StatelessWidget {
  const Titlebar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.brown,
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
            translation(context).contactus,
            style: GoogleFonts.varelaRound(
                fontSize: 36, color: Colors.white, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
