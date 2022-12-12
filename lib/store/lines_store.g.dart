// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lines_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LinesStore on _LinesStore, Store {
  late final _$linesAtom = Atom(name: '_LinesStore.lines', context: context);

  @override
  ObservableList<Line> get lines {
    _$linesAtom.reportRead();
    return super.lines;
  }

  @override
  set lines(ObservableList<Line> value) {
    _$linesAtom.reportWrite(value, super.lines, () {
      super.lines = value;
    });
  }

  late final _$linesCountAtom =
      Atom(name: '_LinesStore.linesCount', context: context);

  @override
  int get linesCount {
    _$linesCountAtom.reportRead();
    return super.linesCount;
  }

  @override
  set linesCount(int value) {
    _$linesCountAtom.reportWrite(value, super.linesCount, () {
      super.linesCount = value;
    });
  }

  late final _$lambdaAtom = Atom(name: '_LinesStore.lambda', context: context);

  @override
  double get lambda {
    _$lambdaAtom.reportRead();
    return super.lambda;
  }

  @override
  set lambda(double value) {
    _$lambdaAtom.reportWrite(value, super.lambda, () {
      super.lambda = value;
    });
  }

  late final _$betaAtom = Atom(name: '_LinesStore.beta', context: context);

  @override
  double get beta {
    _$betaAtom.reportRead();
    return super.beta;
  }

  @override
  set beta(double value) {
    _$betaAtom.reportWrite(value, super.beta, () {
      super.beta = value;
    });
  }

  late final _$timeAtom = Atom(name: '_LinesStore.time', context: context);

  @override
  double get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(double value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$maxTimeAtom =
      Atom(name: '_LinesStore.maxTime', context: context);

  @override
  int get maxTime {
    _$maxTimeAtom.reportRead();
    return super.maxTime;
  }

  @override
  set maxTime(int value) {
    _$maxTimeAtom.reportWrite(value, super.maxTime, () {
      super.maxTime = value;
    });
  }

  late final _$droppedCallsAtom =
      Atom(name: '_LinesStore.droppedCalls', context: context);

  @override
  int get droppedCalls {
    _$droppedCallsAtom.reportRead();
    return super.droppedCalls;
  }

  @override
  set droppedCalls(int value) {
    _$droppedCallsAtom.reportWrite(value, super.droppedCalls, () {
      super.droppedCalls = value;
    });
  }

  late final _$totalCallsAtom =
      Atom(name: '_LinesStore.totalCalls', context: context);

  @override
  int get totalCalls {
    _$totalCallsAtom.reportRead();
    return super.totalCalls;
  }

  @override
  set totalCalls(int value) {
    _$totalCallsAtom.reportWrite(value, super.totalCalls, () {
      super.totalCalls = value;
    });
  }

  late final _$queueCapacityAtom =
      Atom(name: '_LinesStore.queueCapacity', context: context);

  @override
  int get queueCapacity {
    _$queueCapacityAtom.reportRead();
    return super.queueCapacity;
  }

  @override
  set queueCapacity(int value) {
    _$queueCapacityAtom.reportWrite(value, super.queueCapacity, () {
      super.queueCapacity = value;
    });
  }

  late final _$_LinesStoreActionController =
      ActionController(name: '_LinesStore', context: context);

  @override
  void reset() {
    final _$actionInfo =
        _$_LinesStoreActionController.startAction(name: '_LinesStore.reset');
    try {
      return super.reset();
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLinesCount(int value) {
    final _$actionInfo = _$_LinesStoreActionController.startAction(
        name: '_LinesStore.setLinesCount');
    try {
      return super.setLinesCount(value);
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLambda(double value) {
    final _$actionInfo = _$_LinesStoreActionController.startAction(
        name: '_LinesStore.setLambda');
    try {
      return super.setLambda(value);
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBeta(double value) {
    final _$actionInfo =
        _$_LinesStoreActionController.startAction(name: '_LinesStore.setBeta');
    try {
      return super.setBeta(value);
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxTime(int value) {
    final _$actionInfo = _$_LinesStoreActionController.startAction(
        name: '_LinesStore.setMaxTime');
    try {
      return super.setMaxTime(value);
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void nextCall() {
    final _$actionInfo =
        _$_LinesStoreActionController.startAction(name: '_LinesStore.nextCall');
    try {
      return super.nextCall();
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lines: ${lines},
linesCount: ${linesCount},
lambda: ${lambda},
beta: ${beta},
time: ${time},
maxTime: ${maxTime},
droppedCalls: ${droppedCalls},
totalCalls: ${totalCalls},
queueCapacity: ${queueCapacity}
    ''';
  }
}
