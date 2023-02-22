import 'package:bhoomi_seva/loginscreen.dart';
import 'package:bhoomi_seva/navbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tbib_splash_screen/splash_screen_view.dart';
//import 'package:tbib_splash_screen/splash_screen_view.dart';

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
      // backgroundColor: Colors.white,
      //backgroundColor: Colors.white,
      logoSize: 800,
      //backgroundColor: const Color.fromRGBO(248, 255, 242, 1),
      navigateWhere: true,
      navigateRoute: FirebaseAuth.instance.currentUser != null
          ? const KisanRakshak()
          : const LoginScreen(),
      imageSrc: 'assets/abc.png',
    );
  }
}
