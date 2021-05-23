import 'dart:async';
import 'package:flutter/material.dart';

class TimerProvider with ChangeNotifier {
  Stopwatch _watch;
  Timer _timer;
  Duration _currentDuration = Duration.zero;

  TimerProvider() {
    _watch = Stopwatch();
  }

  Duration get currentDuration => _currentDuration;

  Duration get time {
    return _watch.elapsed;
  }

  void _onTick(Timer timer) {
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  void start() {
    if (_timer != null) return;

    _timer = Timer.periodic(new Duration(milliseconds: 30), _onTick);
    _watch.start();
  }

  void stop() {
    if (_watch.isRunning) {
      print('Stop called');
      _timer?.cancel();
      _timer = null;
      _watch.stop();
      _currentDuration = _watch.elapsed;
      notifyListeners();
    }
  }

  void reset() {
    stop();
    _watch.reset();
    _currentDuration = Duration.zero;

    notifyListeners();
  }

  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }
}
