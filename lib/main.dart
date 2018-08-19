import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Klime8",
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image.asset(
            'assets/window_expanded.jpeg',
            fit: BoxFit.cover,
          ),

          new ClipOval(
            clipper: new CircleClipper(
              radius: 140.0,
              offset: const Offset(40.0, 0.0)
            ),
            child: new Image.asset(
              'assets/window.png',
              fit: BoxFit.cover,
            ),
          ),

          new CustomPaint(
            painter: new WhiteCircleCutoutPainter(
              centerOffset: const Offset(40.0, 0.0),
              circles: [
                new Circle(radius: 140.0, alpha: 0x10),
                new Circle(radius: 140.0 + 15.0, alpha: 0x20),
                new Circle(radius: 140.0 + 30.0, alpha: 0x30),
                new Circle(radius: 140.0 + 75.0, alpha: 0x50),
              ]
            ),
            child: new Container(),
          )

        ],
      ),
    );
  }
}

class CircleClipper extends CustomClipper<Rect> {

  final double radius;
  final Offset offset;

  CircleClipper({
    this.radius,
    this.offset = const Offset(0.0 , 0.0),
});

  @override
  Rect getClip(Size size) {
    return new Rect.fromCircle(
      center: new Offset(0.0, size.height / 2) + offset,
      radius: radius,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }

}

//ring creation

class WhiteCircleCutoutPainter extends CustomPainter {

  final Color overlayColor = const Color(0xFFAA88AA);

  final List<Circle> circles;
  final Offset centerOffset;
  final Paint whitePaint;

  WhiteCircleCutoutPainter({
    this.circles = const [],
    this.centerOffset = const Offset(0.0, 0.0),
}) : whitePaint = new Paint();

  @override
  void paint(Canvas canvas, Size size) {
  for ( var i = 1; i < circles.length; ++i) {
  whitePaint.color = overlayColor.withAlpha(circles[i - 1].alpha);

  //fill circle
  canvas.drawCircle(
  new Offset(0.0, size.height / 2) + centerOffset,
  circles[i].radius,
  whitePaint,
  );
  }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
    }
}
class Circle {

  final double radius;
  final int alpha;

  Circle({
    this.radius,
    this.alpha = 0xFF,
  });
}