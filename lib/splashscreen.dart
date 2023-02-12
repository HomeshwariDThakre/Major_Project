import 'package:Bhoomi_Seva/firstpage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      duration: const Duration(milliseconds: 1300),
      backgroundColor: Colors.white,
      // backgroundColor: Color.fromRGBO(248, 255, 242, 1),
      navigateWhere: true,
      navigateRoute: FirstPage(), 
      imageSrc: 'assets/CircularLogo.png',
    );
  }
}
