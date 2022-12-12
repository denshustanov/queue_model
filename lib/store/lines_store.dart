import 'dart:math';

import 'package:line_service_model/model/line.dart';
import 'package:mobx/mobx.dart';

import '../model/call.dart';

part 'lines_store.g.dart';

class LinesStore = _LinesStore with _$LinesStore;

abstract class _LinesStore with Store{
  @observable
  ObservableList<Line> lines = ObservableList();

  @observable
  ObservableList<Call> queue = ObservableList();

  @observable
  int linesCount = 2;

  @observable
  double lambda = 0.1;

  @observable
  double beta = 0.14;

  @observable
  double time = 0;

  @observable
  int maxTime = 1000;

  @observable
  int droppedCalls = 0;

  @observable
  int totalCalls = 0;

  @observable
  int queueCapacity = 1;

  final Random random = Random();

  @action
  void reset(){
    lines.clear();
    time = 0;
    droppedCalls = 0;
    totalCalls = 0;
    for(int i=0; i<linesCount; i++){
      lines.add(Line());
    }
  }

  @action
  void setLinesCount(int value){
    linesCount = value;
  }

  @action
  void setLambda(double value){
    lambda = value;
  }

  @action
  void setBeta(double value){
    beta = value;
  }

  @action
  void setMaxTime(int value){
    maxTime = value;
  }

  @action
  void setQueueCapacity(int value){
    queueCapacity = value;
  }

  @action
  void nextCall(){
    print(queue.length);
    final double l = random.nextDouble();
    time += _callTime(l);
    List<Call> toRemove = [];
    for(Call call in queue){
      if (call.startTime <= time){
        toRemove.add(call);
      }
    }
    queue.removeWhere((element) => toRemove.contains(element));
    totalCalls += 1;
    final double callStartTime = time;
    final double callProcessTime = _serviceTime(l);
    final double callEndTime = time + callProcessTime;
    if(callStartTime < maxTime && callEndTime < maxTime) {
      bool accepted = false;
      for (Line line in lines) {
        if (line.calls.isEmpty || line.calls.last.endTime < callStartTime) {
          line.calls.add(Call(callStartTime, callEndTime));
          accepted = true;
          break;
        }
      }
      if (!accepted) {
        if(queue.length>=queueCapacity) {
          droppedCalls += 1;
        } else{
          Line line = lines.reduce((previousValue, element) => element.calls.last.endTime < previousValue.calls.last.endTime? element: previousValue);
          Call call = Call(line.calls.last.endTime, line.calls.last.endTime+callProcessTime);
          line.calls.add(call);
          queue.add(call);
        }
      }
    }
  }

  double _serviceTime(double l){
    return - log(l)/beta;
  }

  double _callTime(double l){
    return - log(l)/lambda;
  }
}