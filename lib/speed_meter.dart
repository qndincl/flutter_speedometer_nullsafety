import 'package:flutter/material.dart';
import 'arc_painter.dart';

class SpeedIndicator extends StatefulWidget {
  static const Color amber = Color(0xFFFFD54F); // amber[300]
  final double size;
  final int minValue;
  final int maxValue;
  final int currentValue;
  final int warningValue; // warning값을 받아서 그리는데 설정
  final Color backgroundColor;
  final Color meterColor;
  final Color warningColor;
  final Color kimColor;
  final TextStyle displayNumericStyle;
  final String displayText;
  final TextStyle displayTextStyle;

  const SpeedIndicator({
    Key? key,
    this.size = 200,
    this.minValue = 0,
    this.maxValue = 100,
    this.currentValue = 0,
    this.warningValue = 80,
    this.backgroundColor = Colors.black,
    this.meterColor = amber,
    // this.meterColor = Colors.amber[300],  //! The default value of an optional parameter must be constant. 초기값은 상수여야 한다. 라고 하는데
    // this.meterColor = Color(0xFFFFD54F), //! 이렇게도 쓸 수 없다. 왜냐면 초기값은 static const 으로 선언된 값들만을 넣을 수 있기 때문이다.
    this.warningColor = Colors.redAccent,
    this.kimColor = Colors.white,
    this.displayText = '',
    required this.displayNumericStyle, //!
    required this.displayTextStyle, //!
  }) : super(key: key);

  @override
  _SpeedIndicatorState createState() => _SpeedIndicatorState();
}

class _SpeedIndicatorState extends State<SpeedIndicator> {
  @override
  Widget build(BuildContext context) {
    double _size = widget.size;
    int _minValue = widget.minValue; // 0
    int _maxValue = widget.maxValue; // 35
    int _currentValue = widget.currentValue; //
    int _warningValue = widget.warningValue; // 20
    double startAngle = 3.0;
    double endAngle = 21.0;
/*
size = 250
minValue = 0
maxValue = 35
currentValue =15
warningValue = 20
 */
//? kim Angle
    double _kimAngle = 0;
    if (_minValue <= _currentValue && _currentValue <= _maxValue) {
      _kimAngle = (((_currentValue - _minValue) * (endAngle - startAngle)) /
              (_maxValue - _minValue)) +
          startAngle;
    } else if (_currentValue < _minValue) {
      _kimAngle = startAngle;
    } else if (_currentValue > _maxValue) {
      _kimAngle = endAngle;
    }
//? _warning Angle
    double startAngle2 = 0.0;
    double endAngle2 = 36.0;
    double _warningAngle = endAngle2;
    if (_minValue <= _warningValue && _warningValue <= _maxValue) {
      _warningAngle =
          (((_warningValue - _minValue) * (endAngle2 - startAngle2)) /
                  (_maxValue - _minValue)) +
              startAngle2;
    }
//?
    print("_warningAngle =  $_warningAngle");
    return Scaffold(
      body: Container(
        child: Center(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              width: _size,
              height: _size,
              child: Stack(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    // padding: EdgeInsets.all(_size * 0.075),
                    child: Stack(children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: _size,
                          height: _size,
                          decoration: new BoxDecoration(
                            color: widget.backgroundColor,
                            boxShadow: [
                              new BoxShadow(
                                  color: widget.kimColor,
                                  blurRadius: 8.0,
                                  spreadRadius: 4.0)
                            ],
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      // CustomPaint(
                      //   size: Size(_size, _size),
                      //   painter: ArcPainter2(
                      //       startAngle: 9,
                      //       sweepAngle: 18,
                      //       color: widget.warningColor),
                      // ),
                      CustomPaint(
                        size: Size(_size, _size),
                        painter: ArcPainter2(
                            startAngle: 9,
                            sweepAngle: _warningAngle, //! 20.571
                            color: widget.meterColor),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
