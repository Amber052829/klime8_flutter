import 'package:flutter/material.dart';

class WeekDrawer extends StatelessWidget {

final week = [
"Monday\nAugust 20",
"Tuesday\nAugust 21",
"Wednesday\nAugust 22",
"Thursday\nAugust 23",
"Friday\nAugust 24",
"Saturday\nAugust 25",
"Sunday\nAugust 26"
];

List<Widget> _buildDayButtons(){
return week.map((String title){
return new Expanded(child: new GestureDetector(
onTap: (){},
child: new Text(
title,
textAlign: TextAlign.center,
style: new TextStyle(
color: Colors.white,
fontSize: 14.0
),),
),
);
}).toList();
}

  @override
  Widget build(BuildContext context) {
    return new Container(
    width: 125.0,
    height: double.infinity,
      color: const Color(0xAA234060),
        child: new Column(
            children: <Widget>[
            new Expanded(
          child: new Icon(Icons.refresh,
            color: Colors.white,
            size: 40.0,),
          ),
        ]
          ..addAll(_buildDayButtons()),
          ),
        );
  }
}
