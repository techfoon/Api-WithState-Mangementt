import 'package:apiwithstatemangement/api/api_hitter.dart';
import 'package:apiwithstatemangement/bloc/bloc.dart';
import 'package:apiwithstatemangement/bloc/event_block.dart';
import 'package:apiwithstatemangement/bloc/state_block.dart';
import 'package:apiwithstatemangement/model/time_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MaterialApp(
    home: BlocProvider(
      create: (context) => TimeBloc(apiHelper: ApiHitter()),
      child: DigitalWatchPage(),
    ),
  ));
}

class DigitalWatchPage extends StatefulWidget {
  @override
  _DigitalWatchPageState createState() => _DigitalWatchPageState();
}

class _DigitalWatchPageState extends State<DigitalWatchPage> {
  String _time = "";
  String _date = "";
  String _dayOfWeek = "";
  String _timeZone = "";
  int _year = 0;
  int _month = 0;
  int _day = 0;
  int _hour = 0;
  int _minute = 0;
  int _seconds = 0;
  int _milliSeconds = 0;
  String _dateTime = "";
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TimeBloc>(context).add(GetingTimeEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Digital Watch")),
      body: BlocBuilder<TimeBloc, TimeState>(builder: (context, State) {
        if (State is TimeLodingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (State is TimeErrorState) {
          return Center(
            child: Text("${State.msg}"),
          );
        } else if (State is TimeLoadedState) {
          TimeModel mData = State.bresData;
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(_time,
                    style:
                        TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Date: ${mData.date!=null ? mData.date  : 00 }",
                    style: TextStyle(fontSize: 24)),
                Text("Day: ${mData.dayOfWeek}",
                    style: TextStyle(fontSize: 24)),
                Text("Time Zone: ${mData.timeZone}",
                    style: TextStyle(fontSize: 20)),
                SizedBox(height: 20),
                Text("Year: ${mData.year}", style: TextStyle(fontSize: 20)),
                Text("Month: ${mData.month}", style: TextStyle(fontSize: 20)),
                Text("Day: ${mData.day}", style: TextStyle(fontSize: 20)),
                Text("Hour: ${mData.hour}", style: TextStyle(fontSize: 20)),
                Text("Minute: ${mData.minute}",
                    style: TextStyle(fontSize: 20)),
                Text("Seconds: ${mData.seconds}",
                    style: TextStyle(fontSize: 20)),
                Text("Milliseconds: ${mData.milliSeconds}",
                    style: TextStyle(fontSize: 20)),
                Text("DateTime: ${mData.dateTime}",
                    style: TextStyle(fontSize: 20)),
              ],
            ),
          );
        } else {
          return Container();
        }
      }),
    );
  }
}
