import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final IconData icon;
  final Function func;
  RoundedButton({this.icon, this.func});
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(
        icon,
        color: kRailUnselectedColor,
      ),
      backgroundColor: Colors.white,
      mini: true,
      onPressed: func,
      heroTag: null,
    );
  }
}
