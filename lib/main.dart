import 'package:flutter/material.dart';
import 'navbar.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
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
      home: KisanRakshak(),
    );
  }
}
