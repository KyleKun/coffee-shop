import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';

class GradientOrangeButton extends StatelessWidget {
  final String title;
  GradientOrangeButton({this.title});

  static const double width = 250.0;
  static const double height = 52.0;
  static const double borderRadius = 45.0;
  static const double borderHeight = 1.5;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: kOrangeBorderColor, width: borderHeight),
        boxShadow: [
          BoxShadow(
            color: kOrangeShadowColor.withOpacity(0.6),
            blurRadius: 14,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [kOrangeShadowColor, kAccentColor],
        ),
      ),
      child: Center(
        child: Text(
          title.toUpperCase(),
          style: kGradientOrangeButtonTextStyle,
        ),
      ),
    );
  }
}
