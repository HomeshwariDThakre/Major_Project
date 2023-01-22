import 'package:Bhoomi_Seva/firebase_options.dart';
import 'package:Bhoomi_Seva/firestpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'navbar.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
      home: FirstPage(),
    );
  }
}
