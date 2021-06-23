import 'package:flutter/material.dart';
import 'dart:math' as math;

// 원에다가 속도 부분 위에 그리는거. 사각형을 만들고 그걸 기울여서 하는것.
class ArcPainter2 extends CustomPainter {
  ArcPainter2(
      {this.startAngle = 0, this.sweepAngle = 0, this.color = Colors.white});
  final double startAngle;
  final double sweepAngle;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(size.width * 0.05, size.width * 0.05,
        size.width * 0.95, size.height * 0.95);
    final rect2 = Rect.fromLTRB(37.5, 37.5, 212.5, 212.5);
    final rect3 = Rect.fromLTRB(59.5, 59.5, 187.5, 187.5);
    // print("size = ${size}");
    // print("size.w = ${size.width}"); // 패딩으로 값이 줄어서 들어온 것
    // print("size.j = ${size.height}");
    final startAngle = math.pi / 12 * this.startAngle;
    final sweepAngle = math.pi / 12 * this.sweepAngle;
    final useCenter = false;
    final paint = Paint()
      ..color = this.color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1; //선의 굵기
    final paint2 = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1; //선의 굵기
    final paint3 = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.1; //선의 굵기
    canvas.drawArc(rect, startAngle, sweepAngle + 0.5, useCenter, paint);
    canvas.drawArc(rect2, startAngle, sweepAngle + 0.5, useCenter, paint2);
    canvas.drawArc(rect3, startAngle, sweepAngle + 0.5, useCenter, paint3);
    print("start Angle = $startAngle");
    print("sweep Angle = $sweepAngle");
    print("rect2 = $rect2");
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // throw UnimplementedError();

    return false;
  }
}
