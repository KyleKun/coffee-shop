import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:flutter/material.dart';

class ProductImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 202.0,
      height: 178.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: kOrangeBorderColor, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: kOrangeShadowColor.withOpacity(0.6),
            blurRadius: 14,
          )
        ],
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 1.0],
          colors: [kOrangeShadowColor, kAccentColor],
        ),
      ),
      child: Image.asset('assets/images/products/add_classic_latte.png'),
    );
  }
}
