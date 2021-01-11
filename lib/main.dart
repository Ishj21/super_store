import 'package:flutter/material.dart';
import 'package:super_store/dashboard.dart';
import 'package:super_store/sign_in.dart';
import 'splash.dart';
import 'cart.dart';
import 'constants.dart';

void main() => runApp(SuperStore());

class SuperStore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        '/signin': (context) => SignIn(),
        '/dashboard': (context) => DashBoard(),
        '/cart': (context) => ShoppingCart(),
      },
      theme: ThemeData.light().copyWith(
        primaryColor: primaryColor,
        backgroundColor: backgroundColor,
      ),
    );
  }
}
