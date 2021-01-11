import 'dart:async';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:super_store/sign_in.dart';
import 'main.dart';
import 'constants.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        PageTransition(type: PageTransitionType.rightToLeft, child: SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [primaryColor, Color(0xFFFF7D7D)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.4, 1]),
        ),
        child: logoWidget(),
      ),
    );
  }
}

class logoWidget extends StatelessWidget {
  const logoWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'lib/images/shop.png',
          scale: 5,
        ),
        Text(
          'SUPER STORE',
          style: TextStyle(
              fontFamily: 'Momcake',
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        )
      ],
    );
  }
}
