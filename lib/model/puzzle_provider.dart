import 'package:flutter/material.dart';
import 'package:sudoku/model/puzzle.dart';

class PuzzleProvider with ChangeNotifier {
  Puzzle _puzzle;
  int _selectedIndex = -1;
  bool _puzzleSolved = false;
  int _emptyCells = 0;

  PuzzleProvider() {
    loadPuzzle();
  }

  void loadPuzzle() {
    _puzzle = new Puzzle(puzzle: [
      0,
      0,
      0,
      2,
      6,
      0,
      7,
      0,
      1,
      6,
      8,
      0,
      0,
      7,
      0,
      0,
      9,
      0,
      1,
      9,
      0,
      0,
      0,
      4,
      5,
      0,
      0,
      8,
      2,
      0,
      1,
      0,
      0,
      0,
      4,
      0,
      0,
      0,
      4,
      6,
      0,
      2,
      9,
      0,
      0,
      0,
      5,
      0,
      0,
      0,
      3,
      0,
      2,
      8,
      0,
      0,
      9,
      3,
      0,
      0,
      0,
      7,
      4,
      0,
      4,
      0,
      0,
      5,
      0,
      0,
      3,
      6,
      7,
      0,
      3,
      0,
      1,
      8,
      0,
      0,
      0
    ], solution: [
      4,
      3,
      5,
      2,
      6,
      9,
      7,
      8,
      1,
      6,
      8,
      2,
      5,
      7,
      1,
      4,
      9,
      3,
      1,
      9,
      7,
      8,
      3,
      4,
      5,
      6,
      2,
      8,
      2,
      6,
      1,
      9,
      5,
      3,
      4,
      7,
      3,
      7,
      4,
      6,
      8,
      2,
      9,
      1,
      5,
      9,
      5,
      1,
      7,
      4,
      3,
      6,
      2,
      8,
      5,
      1,
      9,
      3,
      2,
      6,
      8,
      7,
      4,
      2,
      4,
      8,
      9,
      5,
      7,
      1,
      3,
      6,
      7,
      6,
      3,
      4,
      1,
      8,
      2,
      5,
      9
    ]);
    _emptyCells = countEmptyCells(puzzle.puzzle);
  }

  int countEmptyCells(List<int> puzzle) {
    int count = 0;
    for (int i = 0; i < puzzle.length; i++) {
      if (puzzle[i] == 0) {
        count += 1;
      }
    }
    return count;
  }

  bool get isPuzzleSolved {
    return _puzzleSolved;
  }

  Puzzle get puzzle {
    return _puzzle;
  }

  int get currentIndex {
    return _selectedIndex;
  }

  void setSelectedIndex(int idx) {
    this._selectedIndex = idx;
    notifyListeners();
  }

  void setValue(int value) {
    if (_selectedIndex != -1) {
      if (_puzzle.attempt[_selectedIndex] == 0 &&
          _puzzle.solution[_selectedIndex] == value) {
        _emptyCells -= 1;
      }

      _puzzle.attempt[_selectedIndex] = value;

      if (_emptyCells == 0) {
        _puzzleSolved = true;
      }
      notifyListeners();
    }
  }

  void clearValue() {
    if (_selectedIndex != -1) {
      if (_puzzle.attempt[_selectedIndex] != 0) {
        if (_puzzle.attempt[_selectedIndex] ==
            _puzzle.solution[_selectedIndex]) {
          _emptyCells += 1;
        }
        _puzzle.attempt[_selectedIndex] = 0;

        notifyListeners();
      }
    }
  }

  void resetBoard() {
    _puzzle.attempt = [..._puzzle.puzzle];
    _selectedIndex = -1;
    _emptyCells = countEmptyCells(_puzzle.attempt);
    _puzzleSolved = false;
    notifyListeners();
  }
}
