import 'package:flutter/material.dart';
import 'package:flutter_speedmeter_test/speed_meter.dart';

void main() {
  // runApp(MaterialApp(home: MyAp2()));
  runApp(MaterialApp(
      home: Center(
    child: SpeedIndicator(
      size: 250,
      minValue: 0,
      maxValue: 35,
      currentValue: 15, // 현재 속도
      // currentValue: 76, // 현재 속도
      warningValue: 20,
      displayText: 'km/h',
      displayTextStyle: TextStyle(color: Colors.red),
      displayNumericStyle: TextStyle(color: Colors.red),
    ),
  )));

  // child: Speedometer(
  //   size: 250,
  //   minValue: 0,
  //   maxValue: 180,
  //   currentValue: 76,
  //   warningValue: 150,
  //   displayText: 'mph',
  //   displayTextStyle: TextStyle(color: Colors.red),
  //   displayNumericStyle: TextStyle(color: Colors.red),
  // ),
  // ));
}

//test
class MyAp2 extends StatelessWidget {
  const MyAp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text("ASDASDA"),
      ),
    );
  }
}
