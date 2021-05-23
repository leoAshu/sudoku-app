import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/puzzle_provider.dart';
import 'package:sudoku/model/timer_provider.dart';
import 'package:sudoku/view/home_screen.dart';
import 'view/puzzle_screen.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(
    // SystemUiOverlayStyle(statusBarColor: Colors.white));
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarBrightness: Brightness.dark));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PuzzleProvider()),
        ChangeNotifierProvider(create: (_) => TimerProvider())
      ],
      child: MaterialApp(
        home: HomeScreen(),
        routes: {'puzzle': (ctx) => PuzzleScreen()},
      ),
    );
  }
}
