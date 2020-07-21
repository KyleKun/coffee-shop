import 'package:coffee_shop/models/product.dart';
import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class SingleProduct extends StatelessWidget {
  final Product product;
  SingleProduct({@required this.product});

  // Product's Container properties
  static const double height = 255.0;
  static const double width = 140.0;
  static const double borderRadius = 15.0;
  static const double borderHeight = 1.5;

  // Background Gradient Container height
  static const double heightGradientContainer = 200.0;

  // Orange Gradient Container properties
  static const double heightOrangeGradientContainer = 100.0;
  static const double widthOrangeGradientContainer = 112.0;

  // Product's details
  static const String money = '\$ ';
  static const String liked = 'assets/images/icons/liked.png';
  static const String notLiked = 'assets/images/icons/not_liked.png';

  Widget _orangeGradientContainer() {
    return Container(
      width: widthOrangeGradientContainer,
      height: heightOrangeGradientContainer,
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
          stops: [0.2, 1.0],
          colors: [kOrangeShadowColor, kAccentColor],
        ),
      ),
    );
  }

  Widget _backgroundGradientContainer() {
    return Container(
      height: heightGradientContainer,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        gradient: RadialGradient(
          radius: 5.0,
          colors: [
            kProductContainerBackgroundColor,
            kProductContainerShadowColor
          ],
        ),
        border: Border.all(color: Colors.white, width: borderHeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (_) {
        return Container(
          height: height,
          width: width,
          color: kBackgroundColor,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _backgroundGradientContainer(),
              Positioned(
                top: 40,
                right: 12,
                child: _orangeGradientContainer(),
              ),
              Positioned(
                // Necessary to adjust Iced Caramel Mocca
                top: (product.name.length < 18) ? 5 : -12,
                right: (product.name.length < 18) ? null : 8,
                child: Image.asset(product.imagePath),
              ),
              Positioned(
                // Necessary to adjust Iced Caramel Mocca
                bottom: (product.name.length < 18) ? 65 : 54,
                left: 26,
                child: Text(
                  product.name,
                  style: kProductNameTextStyle,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 20,
                child: Text(
                  money + product.price,
                  style: kPriceTagTextStyle,
                ),
              ),
              Positioned(
                bottom: 18,
                left: 18,
                child: GestureDetector(
                  onTap: () => Controller.to.like(product.id),
                  child: Image.asset(
                    Controller.to.likes[product.id] ? liked : notLiked,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
