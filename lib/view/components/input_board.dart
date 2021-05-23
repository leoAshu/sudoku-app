import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utility/constants.dart';
import '../../model/puzzle_provider.dart';

class InputBoard extends StatelessWidget {
  final double gridSize;

  const InputBoard({@required this.gridSize});

  void _onTap(BuildContext context, int value) {
    Provider.of<PuzzleProvider>(context, listen: false).setValue(value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.gridSize,
      height: 50,
      decoration: BoxDecoration(
          color: Constants.bgColor,
          border: Border.all(color: Constants.primaryColor, width: 1)),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 12,
        color: Constants.bgColor,
        shadowColor: Constants.primaryColor,
        child: Flex(
          direction: Axis.horizontal,
          children: List.generate(9, (index) {
            return Expanded(
              child: InkWell(
                focusColor: Constants.secondaryColorAlt,
                onTap: () => _onTap(context, index + 1),
                child: Container(
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: TextStyle(
                          fontSize: 24,
                          color: Constants.primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
