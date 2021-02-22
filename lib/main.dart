import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new ClipPath(
            child: new Image.network(
                "https://c402277.ssl.cf1.rackcdn.com/photos/18134/images/hero_full/Medium_WW226365.jpg?1574452099"),
            clipper: new MyClipper(),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    // path.moveTo(size.width, 0);
    path.lineTo(0, size.height);

    // var firstEndPoint = new Offset(0, size.height-20);
    var firstControllPoint = new Offset(size.width / 4, size.height);
    var firstEndPoint = new Offset(size.width / 2.25, size.height - 30);
    path.quadraticBezierTo(firstControllPoint.dx, firstControllPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);
    var secondControllPoint =
        new Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = new Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControllPoint.dx, secondControllPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width, 0);
    path.close();
    // path.lineTo(0, size.height);
    // path.lineTo(size.width, 0);
    // path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
