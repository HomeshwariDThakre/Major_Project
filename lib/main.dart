import 'package:bhoomi_seva/splashscreen.dart';
import 'package:bhoomi_seva/weather.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //   options: DefaultFirebaseOptions.currentPlatform,
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var weather;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bhoomi_Seva',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // localizationsDelegates: [
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      supportedLocales: [
        Locale('en', 'US'), // English, no country code
        Locale('hin', 'India'), // hindi, no country code
        Locale('mar', 'India'), // mar, no country code
      ],
      home: SplashScreen(),
      // home: StreamBuilder<User?>(
      //     builder: (BuildContext context, AsyncSnapshot snapshot) {
      //   if (snapshot.hasError) {
      //     return Text(snapshot.error.toString());
      //   }
      //   if (snapshot.connectionState == ConnectionState.active) {
      //     if (snapshot.data == null) {
      //       return SplashScreen();
      //     } else {
      //       weather = Weather();
      //       //title: FirebaseAuth.instance.currentUser!.displayName!);
      //       return weather;
      //     }
      //   }
      //   return Text("error");
      // })
    );
  }
}
