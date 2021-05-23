import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/puzzle_provider.dart';
import 'package:sudoku/model/timer_provider.dart';
import 'package:sudoku/utility/constants.dart';
import 'package:sudoku/view/components/header_board.dart';
import 'components/sudoku_board.dart';
import 'components/input_board.dart';

class PuzzleScreen extends StatefulWidget {
  @override
  _PuzzleScreenState createState() => _PuzzleScreenState();
}

class _PuzzleScreenState extends State<PuzzleScreen> {
  bool _puzzleSolved;

  void _backPressed() {
    if (_puzzleSolved) {
      Provider.of<TimerProvider>(context, listen: false).reset();
      //Route to homescreen/ puzzles screen
    } else {
      Provider.of<TimerProvider>(context, listen: false).stop();
      Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    // Provider.of<TimerProvider>(context, listen: false).reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gridSize = MediaQuery.of(context).size.width - 24;
    final cellSize = gridSize / 9;
    final sectionSize = gridSize / 3;
    _puzzleSolved = Provider.of<PuzzleProvider>(context).isPuzzleSolved;
    return WillPopScope(
      onWillPop: () {
        _backPressed();
        return Future.value(false);
      },
      child: _puzzleSolved
          ? Scaffold(
              body: Center(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Completed'),
                      ElevatedButton(
                          onPressed: () {
                            Provider.of<PuzzleProvider>(context, listen: false)
                                .resetBoard();
                            Provider.of<TimerProvider>(context, listen: false)
                                .reset();
                            Navigator.of(context).pop();
                          },
                          child: Text('DONE'))
                    ],
                  ),
                ),
              ),
            )
          : Scaffold(
              appBar: AppBar(
                title: Text(
                  'SUDOKU',
                  style: TextStyle(
                      color: Constants.primaryColor,
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1),
                ),
                centerTitle: true,
                actionsIconTheme: IconThemeData(color: Constants.primaryColor),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios_outlined),
                  onPressed: _backPressed,
                ),
                iconTheme: IconThemeData(color: Constants.primaryColor),
                // elevation: 0,
                backgroundColor: Constants.bgColor,
              ),
              backgroundColor: Constants.bgColor,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeaderBoard(
                      gridSize: gridSize,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    SudokuBoard(
                      gridSize: gridSize,
                      sectionSize: sectionSize,
                      cellSize: cellSize,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InputBoard(
                      gridSize: gridSize,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
