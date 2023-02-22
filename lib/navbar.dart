import 'package:bhoomi_seva/chatbotscreen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'about_us.dart';
import 'soil.dart';
import 'tips.dart';
import 'weather.dart';

class KisanRakshak extends StatefulWidget {
  const KisanRakshak({super.key});

  @override
  State<StatefulWidget> createState() => KisanRakshakState();
}

class KisanRakshakState extends State<KisanRakshak> {
  int currentIndex = 2;
  final List<Widget> _pages = [
    const Weather(),
    const SoilList(),
    const ChatBotScreen(),
    const Tips(),
    const AboutUs(),
  ];

  List colors = [
    Colors.green.shade200,
    Colors.green.shade200,
    Colors.white,
    Colors.green.shade200,
    Colors.white,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[currentIndex],
      body: _pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
        color: Colors.green.shade400,
        backgroundColor: Colors.transparent,
        items: const <Widget>[
          Icon(FontAwesomeIcons.cloudSunRain, size: 30),
          Icon(FontAwesomeIcons.seedling, size: 30),
          Icon(FontAwesomeIcons.gitlab, size: 30),
          Icon(FontAwesomeIcons.list, size: 30),
          Icon(FontAwesomeIcons.mobile, size: 30),
        ],
        onTap: (index) => setState(() => currentIndex = index),
      ),
      // bottomNavigationBar: Stack(
      //   alignment: AlignmentDirectional.bottomCenter,
      //   // overflow: Overflow.visible,
      //   children: [
      //     CustomPaint(
      //       size: Size(size.width, 80),
      //       painter: BNBCustomPainter(),
      //     ),
      //     Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: [
      //         Center(
      //           heightFactor: 0.6,
      //           child: FloatingActionButton(
      //               backgroundColor: Colors.green,
      //               elevation: 0.1,
      //               onPressed: () {
      //                 setBottomBarIndex(2);
      //               },
      //               child: const Icon(FontAwesomeIcons.gitlab)),
      //         ),
      //         const SizedBox(
      //           height: 26,
      //         ),
      //         Text(
      //           'Sahayak ',
      //           style: GoogleFonts.getFont('Didact Gothic',
      //               color: Colors.white,
      //               fontWeight: FontWeight.bold,
      //               fontSize: 14),
      //         )
      //       ],
      //     ),
      //     SizedBox(
      //       width: size.width,
      //       height: 80,
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: [
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               IconButton(
      //                 icon: Icon(
      //                   FontAwesomeIcons.cloudSunRain,
      //                   color: currentIndex == 0 ? Colors.white : Colors.black,
      //                 ),
      //                 onPressed: () {
      //                   setBottomBarIndex(0);
      //                 },
      //                 splashColor: Colors.white,
      //               ),
      //               Text(
      //                 'Weather',
      //                 style: GoogleFonts.didactGothic(
      //                     fontSize: 14,
      //                     color:
      //                         currentIndex == 0 ? Colors.white : Colors.black),
      //               )
      //             ],
      //           ),
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               IconButton(
      //                   icon: Icon(
      //                     FontAwesomeIcons.seedling,
      //                     color:
      //                         currentIndex == 1 ? Colors.white : Colors.black,
      //                   ),
      //                   onPressed: () {
      //                     setBottomBarIndex(1);
      //                   }),
      //               Text(
      //                 'Soilpedia',
      //                 style: GoogleFonts.didactGothic(
      //                     fontSize: 14,
      //                     color:
      //                         currentIndex == 1 ? Colors.white : Colors.black),
      //               )
      //             ],
      //           ),
      //           Container(
      //             width: size.width * 0.20,
      //           ),
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               IconButton(
      //                   icon: Icon(
      //                     FontAwesomeIcons.list,
      //                     color:
      //                         currentIndex == 3 ? Colors.white : Colors.black,
      //                   ),
      //                   onPressed: () {
      //                     setBottomBarIndex(3);
      //                   }),
      //               Text(
      //                 'Tips',
      //                 style: GoogleFonts.didactGothic(
      //                     fontSize: 14,
      //                     color:
      //                         currentIndex == 3 ? Colors.white : Colors.black),
      //               )
      //             ],
      //           ),
      //           Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               IconButton(
      //                   icon: Icon(
      //                     FontAwesomeIcons.mobile,
      //                     color:
      //                         currentIndex == 4 ? Colors.white : Colors.black,
      //                   ),
      //                   onPressed: () {
      //                     setBottomBarIndex(4);
      //                   }),
      //               Text(
      //                 'Contact Us',
      //                 style: GoogleFonts.didactGothic(
      //                     fontSize: 14,
      //                     color:
      //                         currentIndex == 4 ? Colors.white : Colors.black),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: const Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
