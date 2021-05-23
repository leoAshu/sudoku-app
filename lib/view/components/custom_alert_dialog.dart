import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/puzzle_provider.dart';
import '../../model/timer_provider.dart';
import '../../utility/constants.dart';

class CustomDialogBox extends StatelessWidget {
  final String _title;
  final String _description;

  const CustomDialogBox(this._title, this._description);

  void _actionOk(BuildContext context) {
    Provider.of<PuzzleProvider>(context, listen: false).resetBoard();
    Provider.of<TimerProvider>(context, listen: false).reset();
    Provider.of<TimerProvider>(context, listen: false).start();
    Navigator.of(context).pop();
  }

  void _actionCancel(BuildContext context) {
    Navigator.of(context).pop();
    Provider.of<TimerProvider>(context, listen: false).start();
  }

  Widget getDialogAction(Function callback, String label) {
    return TextButton(onPressed: callback, child: Text(label));
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.2,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Card(
          elevation: 12,
          color: Constants.bgColor,
          shadowColor: Constants.primaryColor,
          margin: const EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                _title,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                _description,
                style: TextStyle(
                    color: Constants.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  getDialogAction(() => _actionOk(context), 'OK'),
                  getDialogAction(() => _actionCancel(context), 'Cancel')
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
