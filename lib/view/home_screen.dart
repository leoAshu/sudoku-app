import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utility/constants.dart';
import '../model/puzzle_provider.dart';
import './components/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  void play(BuildContext context) {
    Navigator.of(context).pushNamed('home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        child: Container(
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 8,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: Constants.primaryColorAlt, width: 2)),
                      gradient: Constants.bgGradient),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 64),
                    child: Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'MASTER',
                            style: TextStyle(
                                color: Constants.secondaryColorAlt,
                                fontSize: 32,
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'SUDOKU',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 44,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w600),
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed('puzzle');
                            },
                            child: Container(
                              height: 166,
                              width: 166,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 100,
                                        color: Constants.primaryColor,
                                        offset: Offset(2, 2))
                                  ],
                                  border: Border.all(
                                      color: Colors.white, width: 14),
                                  color: Colors.transparent,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow_rounded,
                                  color: Colors.white,
                                  size: 144,
                                ),
                              ),
                            ),
                          ),
                          Spacer(),
                          Spacer()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(flex: 1, child: BottomNav()),
            ],
          ),
        ),
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
