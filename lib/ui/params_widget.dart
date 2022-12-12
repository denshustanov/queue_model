import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_service_model/store/lines_store.dart';

class ParamsWidget extends StatefulWidget {
  const ParamsWidget({Key? key}) : super(key: key);

  @override
  State<ParamsWidget> createState() => _ParamsWidgetState();
}

class _ParamsWidgetState extends State<ParamsWidget> {
  final LinesStore linesStore = GetIt.instance<LinesStore>();
  final TextEditingController _modellingTimeController =
      TextEditingController(text: '1000');
  final TextEditingController _linesCountController =
      TextEditingController(text: '3');
  final TextEditingController _timeIndexController =
      TextEditingController(text: '0.1');
  final TextEditingController _durationIndexController =
      TextEditingController(text: '0.14');
  final TextEditingController _queueCapacityController =
      TextEditingController(text: '1');

  final TextEditingController _iterationLengthController =
      TextEditingController(text: '100');

  final GlobalKey<FormState> _formKey = GlobalKey();

  late Timer timer;

  bool modelling = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: 200,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _modellingTimeController,
                  validator: intValidator,
                  decoration:
                      const InputDecoration(labelText: 'Modelling time'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _linesCountController,
                  validator: intValidator,
                  decoration: const InputDecoration(labelText: 'Lines count'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _timeIndexController,
                  validator: doubleValidator,
                  decoration: const InputDecoration(labelText: 'Time index'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _durationIndexController,
                  validator: doubleValidator,
                  decoration:
                      const InputDecoration(labelText: 'Duration index'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _queueCapacityController,
                  validator: intValidator,
                  decoration:
                      const InputDecoration(labelText: 'Queue capacity'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Dropped calls: ${linesStore.droppedCalls}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Calls in queue: ${linesStore.queue.length}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Total calls: ${linesStore.totalCalls}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Efficiency: ${(1 - linesStore.droppedCalls / linesStore.totalCalls).toStringAsFixed(3)}'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _iterationLengthController,
                  validator: intValidator,
                  decoration: const InputDecoration(
                      labelText: 'Iteration length', suffixText: 'ms'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: modelling ? null : _startHandler,
                    child: const Text('Start'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: ElevatedButton(
                    onPressed: _resetSystemHandler,
                    child: const Text('Reset'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _timerCallback(Timer timer) {
    if (linesStore.time < linesStore.maxTime && modelling) {
      linesStore.nextCall();
      setState(() {});
    } else {
      timer.cancel();
      setState(() {
        modelling = false;
      });
    }
  }

  void _startHandler() {
    if (_formKey.currentState!.validate()) {
      linesStore.reset();
      setState(() {
        modelling = true;
      });
      timer = Timer.periodic(
          Duration(milliseconds: int.parse(_iterationLengthController.text)),
          _timerCallback);
    }
  }

  void _resetSystemHandler() {
    setState(() {
      modelling = false;
    });
    if (_formKey.currentState!.validate()) {
      linesStore.setLinesCount(int.parse(_linesCountController.text));
      linesStore.setBeta(double.parse(_durationIndexController.text));
      linesStore.setLambda(double.parse(_timeIndexController.text));
      linesStore.setMaxTime(int.parse(_modellingTimeController.text));
      linesStore.setQueueCapacity(int.parse(_queueCapacityController.text));
      linesStore.reset();
    }
  }

  String? intValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    if (int.tryParse(value) == null) {
      return 'Must be int';
    }
    if (int.parse(value) < 0) {
      return 'Must be >= 0';
    }
  }

  String? doubleValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required field';
    }
    if (double.tryParse(value) == null) {
      return 'Must be int';
    }
    if (double.parse(value) < 0) {
      return 'Must be >= 0';
    }
  }
}
