import 'dart:async';

import 'package:flutter/material.dart';

import '../models/timer_dto.dart';

class TimerViewModel with ChangeNotifier {
  static const setCounter = 5;
  var timerDto = TimerDto(timer: setCounter);

  late Timer _timer;
  void onPressed() {
    timerDto.timeRun = !timerDto.timeRun;

    if (timerDto.timeRun) {
      _timer = Timer.periodic(
          // Duration 으로 설정된 시간마다 callback 함수를 실행하라
          const Duration(seconds: 1),
          // callback 함수
          (timer) {
        timerDto.timer--;
        if (timerDto.timer < 1) {
          timerDto.timer = setCounter;
          timerDto.timeRun = false;
          timer.cancel();
        }
        notifyListeners();
      });
    } else {
      _timer.cancel();
    }
    notifyListeners();
  }
}
