import 'package:apiwithstatemangement/model/time_model.dart';

abstract class TimeState {}

class TimeInitialState extends TimeState {}

class TimeLodingState extends TimeState {}

class TimeLoadedState extends TimeState {
  TimeModel bresData;

  TimeLoadedState({required this.bresData});
}

class TimeErrorState extends TimeState {
  String msg;

  TimeErrorState({required this.msg});
}
