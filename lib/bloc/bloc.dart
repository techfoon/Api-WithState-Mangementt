import 'package:apiwithstatemangement/api/api_hitter.dart';
import 'package:apiwithstatemangement/bloc/event_block.dart';
import 'package:apiwithstatemangement/bloc/state_block.dart';
import 'package:apiwithstatemangement/model/time_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:apiwithstatemangement/api/Urlkeys.dart';

class TimeBloc extends Bloc<TimeEvent, TimeState> {
  ApiHitter apiHelper;

  TimeBloc({required this.apiHelper}) : super(TimeInitialState()) {
    on<GetingTimeEvent>((event, State) {
      emit(TimeLodingState());

      var resJson = apiHelper.ApiGeter(jsonUrl: Urlkeys.urlkey);

            

     

      if (resJson != null) {
        emit(TimeLoadedState(bresData: TimeModel.fromJson( apiHelper.resData)));
      } else {
        emit(TimeErrorState(msg: "uhh.. No!!, Error Occured."));
      }
    });
  }
}
