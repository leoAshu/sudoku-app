import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sudoku/model/puzzle.dart';
import 'package:sudoku/model/puzzle_provider.dart';
import '../../utility/constants.dart';

class SudokuBoard extends StatefulWidget {
  const SudokuBoard({
    Key key,
    @required this.gridSize,
    @required this.sectionSize,
    @required this.cellSize,
  }) : super(key: key);

  final double gridSize;
  final double sectionSize;
  final double cellSize;

  @override
  _SudokuBoardState createState() => _SudokuBoardState();
}

class _SudokuBoardState extends State<SudokuBoard> {
  List<int> puzzle, solution, attempt;
  int _selectedIndex;

  void _onCellSelect(int idx) {
    Provider.of<PuzzleProvider>(context, listen: false).setSelectedIndex(idx);
  }

  bool isCellSelected(int index) {
    if (this._selectedIndex == -1) return false;

    int startIndex = _selectedIndex - _selectedIndex % 9;

    if (index % 9 == this._selectedIndex % 9) {
      if (startIndex == 0 || startIndex == 27 || startIndex == 54) {
        if (index == _selectedIndex + 9 || index == _selectedIndex + 18)
          return false;
        else
          return true;
      } else if (startIndex == 9 || startIndex == 36 || startIndex == 63) {
        if (index == _selectedIndex - 9 || index == _selectedIndex + 9)
          return false;
        else
          return true;
      } else {
        if (index == _selectedIndex - 9 || index == _selectedIndex - 18)
          return false;
        else
          return true;
      }
    } else if (index >= startIndex && index <= (startIndex + 8)) {
      int idx = _selectedIndex - _selectedIndex % 3;
      if (index >= idx && index <= (idx + 2)) return false;
      return true;
    } else
      return false;
  }

  bool isBlockSelected(int index) {
    if (this._selectedIndex == -1) return false;

    int startIndex = _selectedIndex - _selectedIndex % 9;
    int row = startIndex ~/ 9;
    int col = _selectedIndex % 9;

    switch (index) {
      case 0:
        if (row >= 0 && row <= 2 && col >= 0 && col <= 2)
          return true;
        else
          return false;
        break;
      case 1:
        if (row >= 0 && row <= 2 && col >= 3 && col <= 5)
          return true;
        else
          return false;
        break;
      case 2:
        if (row >= 0 && row <= 2 && col >= 6 && col <= 8)
          return true;
        else
          return false;
        break;
      case 3:
        if (row >= 3 && row <= 5 && col >= 0 && col <= 2)
          return true;
        else
          return false;
        break;
      case 4:
        if (row >= 3 && row <= 5 && col >= 3 && col <= 5)
          return true;
        else
          return false;
        break;
      case 5:
        if (row >= 3 && row <= 5 && col >= 6 && col <= 8)
          return true;
        else
          return false;
        break;
      case 6:
        if (row >= 6 && row <= 8 && col >= 0 && col <= 2)
          return true;
        else
          return false;
        break;
      case 7:
        if (row >= 6 && row <= 8 && col >= 3 && col <= 5)
          return true;
        else
          return false;
        break;
      case 8:
        if (row >= 6 && row <= 8 && col >= 6 && col <= 8)
          return true;
        else
          return false;
        break;
      default:
        return false;
    }
  }

  Color getTextColor(int index) {
    if (puzzle[index] != 0)
      return Constants.secondaryColor;
    else {
      return Constants.primaryColorFaded;
      // print('Attempt: ${attempt[index]} \nSolution: ${solution[index]}');
      // if (attempt[index] == solution[index]) {
      //   return Constants.primaryColorFaded;
      // } else {
      //   return Colors.redAccent;
      // }
    }
  }

  Border getBlockBorder(int index) {
    BorderSide _side = BorderSide(color: Constants.primaryColor, width: 1);
    Border _border;
    switch (index) {
      case 0:
        _border = Border(bottom: _side, right: _side);
        break;
      case 1:
        _border = Border(left: _side, bottom: _side, right: _side);
        break;
      case 2:
        _border = Border(left: _side, bottom: _side);
        break;
      case 3:
        _border = Border(top: _side, bottom: _side, right: _side);
        break;
      case 4:
        _border = Border.all(color: Constants.primaryColor, width: 1);
        break;
      case 5:
        _border = Border(left: _side, bottom: _side, top: _side);
        break;
      case 6:
        _border = Border(top: _side, right: _side);
        break;
      case 7:
        _border = Border(top: _side, left: _side, right: _side);
        break;
      case 8:
        _border = Border(top: _side, left: _side);
        break;
    }
    return _border;
  }

  @override
  Widget build(BuildContext context) {
    Puzzle puzzleObject = Provider.of<PuzzleProvider>(context).puzzle;
    _selectedIndex = Provider.of<PuzzleProvider>(context).currentIndex;
    puzzle = puzzleObject.puzzle;
    solution = puzzleObject.solution;
    attempt = puzzleObject.attempt;
    return Column(
      children: [
        Card(
          color: Constants.bgColor,
          margin: EdgeInsets.all(0),
          shadowColor: Constants.primaryColor,
          elevation: 12,
          child: Container(
            height: widget.gridSize,
            width: widget.gridSize,
            margin: EdgeInsets.zero,
            child: Stack(children: [
              // 9 Blocks
              GridView.count(
                crossAxisCount: 3,
                children: List.generate(9, (index) {
                  return Container(
                      height: widget.sectionSize,
                      width: widget.sectionSize,
                      decoration: BoxDecoration(
                          color: isBlockSelected(index)
                              ? Constants.secondaryColorFadedAlt
                              : null,
                          border: getBlockBorder(index)));
                }),
              ),
              // 81 Cells
              GridView.count(
                crossAxisCount: 9,
                children: List.generate(81, (index) {
                  return InkWell(
                    onTap: this.puzzle[index] == 0
                        ? () => _onCellSelect(index)
                        : null,
                    child: Container(
                      height: widget.cellSize,
                      width: widget.cellSize,
                      decoration: BoxDecoration(
                          color: this._selectedIndex == index
                              ? Constants.primaryColorAltFaded
                              : isCellSelected(index)
                                  ? Constants.secondaryColorFadedAlt
                                  : null,
                          border: Border.all(
                              color: Constants.secondaryColorFadedAlt,
                              width: 1)),
                      child: Center(
                        child: Text(
                          '${this.attempt[index] != 0 ? this.attempt[index] : ' '}',
                          style: TextStyle(
                              color: getTextColor(index),
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
