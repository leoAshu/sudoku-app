import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/utility/constants.dart';
import '../../model/timer_provider.dart';

class TimerWidget extends StatefulWidget {
  TimerWidget();

  @override
  _TimerWidgetState createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  bool isInit = true;
  Duration _duration;

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      Provider.of<TimerProvider>(context, listen: false).start();
    }
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    _duration = Provider.of<TimerProvider>(context).time;
    return Card(
      color: Constants.bgColor,
      margin: EdgeInsets.all(0),
      shadowColor: Constants.primaryColor,
      elevation: 12,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Constants.primaryColor),
          // borderRadius: BorderRadius.circular()),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              _printDuration(_duration),
              style: TextStyle(
                  fontSize: 16,
                  color: Constants.primaryColor,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
