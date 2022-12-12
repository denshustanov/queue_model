import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:line_service_model/store/lines_store.dart';

import '../../model/line.dart';
import 'line_painter.dart';

class LineWidget extends StatefulWidget {
  const LineWidget({Key? key}) : super(key: key);

  @override
  State<LineWidget> createState() => _LineWidgetState();
}

class _LineWidgetState extends State<LineWidget> {
  final LinesStore linesStore = GetIt.instance<LinesStore>();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      final height = MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          Scaffold.of(context).appBarMaxHeight!;
      final width = MediaQuery.of(context).size.width - 300;
      return SizedBox(
        width: width,
        height: height,
        child: Observer(
          builder: (context) => CustomPaint(
            painter: LinePainter(linesStore: linesStore),
          ),
        ),
      );
    });
  }
}
