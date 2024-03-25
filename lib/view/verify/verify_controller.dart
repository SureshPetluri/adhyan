import 'dart:async';

import 'package:flutter/cupertino.dart';

class VerifyController extends ChangeNotifier {
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();
  TextEditingController fieldFive = TextEditingController();
  TextEditingController fieldSix = TextEditingController();

  int seconds = 20;
  bool isTimerRunning = false;
   Timer? timer;

  void startTimer() {
    seconds = 20;
    if (!isTimerRunning) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        seconds -= 1;
        notifyListeners();
        if (seconds == 0) {
          timer.cancel();
          seconds = 20;
          isTimerRunning = false;
        }
      });
      isTimerRunning = true;

    }



    notifyListeners();
  }

  void resetTimer() {
    seconds = 20;
    isTimerRunning = false;
    if(timer != null){
      timer?.cancel();
    }
    notifyListeners();
  }
}
