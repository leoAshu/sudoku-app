import 'package:flutter/material.dart';
import '../../utility/constants.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.primaryColorAltFaded,
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Opacity(
              opacity: 0.6,
              child: Image.asset(
                'assets/pattern.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavItem('Settings', Icons.settings),
              Container(
                height: 52,
                width: 1,
                color: Colors.white,
              ),
              NavItem('Statistics', Icons.bar_chart_outlined),
              Container(
                height: 52,
                width: 1,
                color: Colors.white,
              ),
              NavItem('Scan', Icons.camera_alt_outlined)
            ],
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String label;
  final IconData icon;

  NavItem(this.label, this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 32,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            label,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }
}
