class Puzzle {
  List<int> puzzle;
  List<int> solution;
  List<int> attempt;

  Puzzle({this.puzzle, this.solution}) {
    this.attempt = [...puzzle];
  }
}
