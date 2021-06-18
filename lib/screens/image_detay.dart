import 'package:flutter/material.dart';

class ImageDetayScreen extends StatefulWidget {
  final String imgPath;

  const ImageDetayScreen({
    Key? key,
    required this.imgPath,
  }) : super(key: key);

  @override
  _ImageDetayScreenState createState() => _ImageDetayScreenState();
}

class _ImageDetayScreenState extends State<ImageDetayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Hero(
        tag: widget.imgPath,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
