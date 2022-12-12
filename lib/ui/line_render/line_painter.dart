import 'package:flutter/material.dart';
import 'package:line_service_model/store/lines_store.dart';

import '../../model/call.dart';
import '../../model/line.dart';

class LinePainter extends CustomPainter {
  LinePainter({required this.linesStore});

  final LinesStore linesStore;

  final double topOffset = 10;
  final double leftOffset = 10;
  final double rightOffset = 10;
  final double lineHeight = 40;
  final double callHeight = 10;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fillPaint = Paint()..color = Colors.white;
    final Paint linePaint = Paint()..color = Colors.blue;
    canvas.drawPaint(fillPaint);
    for (int i = 0; i < linesStore.lines.length; i++) {
      final lineYPos = topOffset + lineHeight / 2 + i * lineHeight;
      canvas.drawLine(Offset(leftOffset, lineYPos),
          Offset(size.width - rightOffset, lineYPos), linePaint);
      for (Call call in linesStore.lines[i].calls) {
        Paint callPaint = Paint()..color = Colors.blue;
        if(linesStore.queue.contains(call)) {
          callPaint = Paint()..color = Colors.red;
        }
        double callStart = timeToCanvasX(call.startTime, size.width);
        double callEnd = timeToCanvasX(call.endTime, size.width);

        canvas.drawRect(
            Offset(callStart, lineYPos - callHeight / 2) &
                Size(callEnd - callStart, callHeight),
            callPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  double timeToCanvasX(double time, double width) {
    return leftOffset + time / linesStore.maxTime * width;
  }
}
