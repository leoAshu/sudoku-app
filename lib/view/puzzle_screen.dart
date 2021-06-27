import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/puzzle_provider.dart';
import 'package:sudoku/model/timer_provider.dart';
import 'package:sudoku/utility/constants.dart';
import 'package:sudoku/view/components/action_board.dart';
import 'package:sudoku/view/components/timer_widget.dart';
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
    final gridSize = MediaQuery.of(context).size.width - 18;
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
              backgroundColor: Constants.primaryColor,
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
              backgroundColor: Constants.primaryColor,
              appBar: AppBar(
                toolbarHeight: 100,
                elevation: 0,
                backgroundColor: Constants.primaryColor,
                title: Text(
                  'SUDOKU',
                  style: TextStyle(
                      color: Constants.secondaryColorAlt,
                      fontSize: 26,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 1),
                ),
                centerTitle: true,
                // actionsIconTheme: IconThemeData(color: Colors.white),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 36,
                  ),
                  onPressed: _backPressed,
                ),
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(gradient: Constants.bgGradient),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TimerWidget(),
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
                      ActionBoard(
                        gridSize: gridSize,
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
            ),
    );
  }
}
