import 'package:flutter/material.dart';
import 'package:line_service_model/ui/line_render/line_widget.dart';
import 'package:line_service_model/ui/params_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: const [
          LineWidget(),
          ParamsWidget(),
        ],
      ),
    );
  }
}
