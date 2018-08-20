import 'package:flutter/material.dart';
import './forecast/background/background_with_rings.dart';
import './forecast/app_bar.dart';
import './forecast/week_drawer.dart';
import 'package:meta/meta.dart';
import './generic_widgets/sliding_drawer.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Klime8",
      debugShowCheckedModeBanner: false,
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  OpenableController openableController;

  @override
  void initState() {
    super.initState();
    openableController = new OpenableController(
      vsync: this,
      openDuration: const Duration(milliseconds: 250),
    )
      ..addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body:new Stack(
            children: <Widget>[
            new BackgroundWithRings(),
      new Positioned(
          top: 0.0, left: 0.0, right: 0.0,
          child: new ForecastAppBar(
            onDrawerArrowTap: openableController.open,
          )),
              new SlidingDrawer(
                  openableController: openableController,
                  drawer: new WeekDrawer(
                onDaySelected: (String title){
                  openableController.close();
                },
              ))
      ],
    ));
  }
}

