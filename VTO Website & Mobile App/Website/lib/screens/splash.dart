import 'dart:async';
import 'package:flutter/material.dart';
import 'package:p1/screens/mainLanding.dart';


class SplashScreen extends StatelessWidget {
@override
Widget build(BuildContext context) {
	return MaterialApp(
	home: MyHomePage(),
	debugShowCheckedModeBanner: false,
	);
}
}

class MyHomePage extends StatefulWidget {
@override
_MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
@override
void initState() {
	super.initState();
	Timer(Duration(seconds: 7),
		()=>Navigator.pushReplacement(context,
										MaterialPageRoute(builder:
														(context) =>
														 MainLanding()
														)
									)
		);
}
@override
Widget build(BuildContext context) {
	return Container(
	color: Colors.white,
	child: Container(
    height: double.infinity,
    width: double.infinity,
		child:Image.asset("assets/splash1.gif",fit: BoxFit.cover,height: double.infinity,width: double.infinity,)
	),
	);
}
}

