import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utility/constants.dart';
import '../model/puzzle_provider.dart';

class HomeScreen extends StatelessWidget {
  void play(BuildContext context) {
    Navigator.of(context).pushNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final contentHeight = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Container(
        padding: EdgeInsets.only(top: topPadding, bottom: bottomPadding),
        child: Center(
            child: Container(
          height: contentHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'SUDOKU',
                style: TextStyle(
                    color: Constants.bgColor,
                    fontSize: 40,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold),
              ),
              Column(
                children: [
                  Option('Play', Icons.play_arrow, 'puzzle'),
                  SizedBox(
                    height: 12,
                  ),
                  Option('Scan', Icons.camera_alt, 'puzzle'),
                  SizedBox(
                    height: 12,
                  ),
                  Option('Statistics', Icons.bar_chart, 'puzzle')
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

class Option extends StatelessWidget {
  final String _text;
  final _icon;
  final String _routeName;

  const Option(this._text, this._icon, this._routeName);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 172,
      child: ElevatedButton(
        onPressed: () {
          if (this._routeName == 'puzzle') {
            Provider.of<PuzzleProvider>(context, listen: false).loadPuzzle();
          }
          Navigator.of(context).pushNamed(this._routeName);
        },
        child: Row(
          children: [
            Text(
              this._text,
              style: TextStyle(
                  color: Constants.secondaryColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Icon(
              this._icon,
              color: Constants.primaryColor,
              size: 32,
            )
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Constants.bgColor,
          // onPrimary: Constants.primaryColor,
          // fixedSize: Size(172, 48),

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      ),
    );
  }
}
