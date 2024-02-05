import 'package:flutter/material.dart';
import 'package:p1/provider/provider1.dart';
import 'package:p1/screen.dart';
import 'package:p1/screens/landing.dart';
import 'package:p1/screens/mainLanding.dart';
import 'package:p1/screens/splash.dart';
import 'package:p1/screens/view.dart';
import 'package:p1/utils/framedisplay.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'men.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Uri _url1 = Uri.parse('http://localhost:8501');
    Future<void> _launchUrl() async {
      if (!await launchUrl(_url1)) {
        throw Exception('Could not launch $_url1');
      }
    }

    return ChangeNotifierProvider(
      create: (context) => Provider1(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen()),
    );
  }
}
