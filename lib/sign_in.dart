import 'package:flutter/material.dart';
import 'package:super_store/constants.dart';
import 'package:super_store/dashboard.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatelessWidget {
  @override
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  createAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Wrong Credentials"),
            content: Text(
                "Incorrect ID or Password, Please try again with correct information"),
            actions: [
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Try Again'))
            ],
          );
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('SuperStore'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.asset(
                    'lib/images/shop.png',
                    scale: 7,
                  ),
                  Text(
                    'SUPER STORE',
                    style: TextStyle(
                        fontFamily: 'Momcake',
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'WELCOME',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Please Sign In to Continue',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      labelText: 'Username (admin)',
                    ),
                  ),
                  TextField(
                    controller: passController,
                    decoration: InputDecoration(
                      labelText: 'Password(admin)',
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      if (usernameController.text == 'admin' &&
                          passController.text == 'admin') {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: DashBoard()));
                      } else {
                        createAlertDialog(context);
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          gradient: LinearGradient(
                              colors: [primaryColor, Color(0xFFFF7D7D)],
                              stops: [0, 1],
                              begin: Alignment.topCenter)),
                      child: Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
