import 'dart:async';
import 'package:flutter/material.dart';
import 'anasayfa.dart';

class Logo extends StatefulWidget {
  Logo({Key? key}) : super(key: key);

  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {
  //logo ref = https://www.google.com/imgres?imgurl=https%3A%2F%2Fimage.shutterstock.com%2Fimage-vector%2Fclassic-book-open-logo-store-260nw-1122471980.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fimage-vector%2Fclassic-book-open-logo-store-1122471980&tbnid=wacnpBC8pVJS7M&vet=10CBkQxiAoCmoXChMIkP3tgLGf8QIVAAAAAB0AAAAAEAs..i&docid=c7-GMi9MKhXx1M&w=260&h=280&itg=1&q=book%20marcet&ved=0CBkQxiAoCmoXChMIkP3tgLGf8QIVAAAAAB0AAAAAEAs#imgrc=wacnpBC8pVJS7M&imgdii=uYO0amVcjnznyM
  String logoPath = "assets/images/logo.png";

  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 6);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Anasayfa()));
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Image.asset(logoPath),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            Text(
              "Splash Screen",
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            Padding(padding: EdgeInsets.only(top: 20.0)),
            CircularProgressIndicator(
              backgroundColor: Colors.white,
              strokeWidth: 1,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: initScreen(context),
    );
  }
}
