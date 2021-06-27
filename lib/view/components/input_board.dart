import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
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
      color: Colors.transparent,
      child: Flex(
        direction: Axis.horizontal,
        children: List.generate(9, (index) {
          return Expanded(
            child: InkWell(
              focusColor: Constants.secondaryColorAlt,
              onTap: () => _onTap(context, index + 1),
              child: Container(
                color: Colors.transparent,
                child: Center(
                  child: Text(
                    '${index + 1}',
                    // style: GoogleFonts.montserrat(),
                    style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
