import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/puzzle_provider.dart';
import '../../model/timer_provider.dart';
import '../../utility/constants.dart';
import './timer_widget.dart';
import './custom_alert_dialog.dart';

class HeaderBoard extends StatelessWidget {
  final double gridSize;

  const HeaderBoard({
    @required this.gridSize,
  });

  void _clear(BuildContext context) {
    Provider.of<PuzzleProvider>(context, listen: false).clearValue();
  }

  void _reset(BuildContext context) {
    Provider.of<TimerProvider>(context, listen: false).stop();
    showDialog(
        context: context,
        builder: (ctx) {
          return CustomDialogBox(
              'Alert', 'Reset the timer and board. Confirm?');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: gridSize,
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 5,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // fixedSize: Size(88, 36),
                  side: BorderSide(color: Constants.primaryColor, width: 1),
                  primary: Constants.bgColor, // background
                  onPrimary: Constants.primaryColor, // foreground
                ),
                onPressed: () => _clear(context),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Clear',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          ),
          Expanded(flex: 6, child: TimerWidget()),
          Flexible(
            flex: 5,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // fixedSize: Size(88, 36),
                  side: BorderSide(color: Colors.redAccent, width: 1),
                  primary: Constants.bgColor, // background
                  onPrimary: Colors.redAccent, // foreground
                ),
                onPressed: () => _reset(context),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Reset',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
