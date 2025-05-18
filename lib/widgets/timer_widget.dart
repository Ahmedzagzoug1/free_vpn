import 'dart:async';

import 'package:flutter/material.dart';
class TimerWidget extends StatefulWidget {
  bool initTimerNow;
   TimerWidget({super.key,required this.initTimerNow});

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Timer? timer;
  Duration duration=Duration();
  startTimerNow(){
timer=Timer.periodic(Duration(seconds: 1),  (timer){
  setState(() {
    duration=Duration(seconds:  duration.inSeconds+1);
  });
  print(duration.inMinutes);
});
  }
  stopTimerNow(){
     timer?.cancel();
     timer=null;
     duration=Duration();
  }
  @override
  Widget build(BuildContext context) {
    if(timer==null||!widget.initTimerNow){
      widget.initTimerNow?startTimerNow():stopTimerNow();
    }
    String twoDigit(number)=>number.toString().padLeft(2,'0');
    String seconds=twoDigit(duration.inSeconds.remainder(60));
    String minutes=twoDigit(duration.inMinutes.remainder(60));
    String hours=twoDigit(duration.inHours.remainder(60));

    return Text('$hours :$minutes : $seconds',
    style: TextStyle(fontSize: 23),);
  }
}
