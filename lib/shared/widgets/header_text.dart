import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  final text;
  final bool isCart;
  HeaderText({this.text, this.isCart = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 45, top: isCart ? 15 : 105),
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}
