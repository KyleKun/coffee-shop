import 'package:coffee_shop/models/product.dart';
import 'package:coffee_shop/screens/home/home.dart';
import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingleOrder extends StatelessWidget {
  final Product product;
  SingleOrder({@required this.product});

  // Order's Container properties
  static const double height = 185.0;
  static const double borderRadius = 15.0;
  static const double borderHeight = 1.5;

  // Background Gradient Container height
  static const double widthGradientContainer = 279.0;
  static const double heightGradientContainer = 157.0;

  // Orange Gradient Container properties
  static const double heightOrangeGradientContainer = 100.0;
  static const double widthOrangeGradientContainer = 112.0;

  // Product's details
  static const String size = 'Size';
  static const String flavor = 'Flavor';
  static const String topping = 'Topping';
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
            color: kOrangeShadowColor.withOpacity(0.7),
            blurRadius: 16,
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
      width: widthGradientContainer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        gradient: LinearGradient(
          stops: [0.92, 1.0],
          colors: [
            kProductContainerBackgroundColor,
            kProductContainerShadowColor.withOpacity(0.1),
          ],
        ),
        border: Border.all(color: Colors.white, width: borderHeight),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return GetBuilder<Controller>(
      builder: (_) {
        return Container(
          height: height,
          width: width,
          color: kLightBackgroundColor,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _backgroundGradientContainer(),
              Positioned(
                top: 15,
                left: 20,
                child: _orangeGradientContainer(),
              ),
              Positioned(
                top: -12,
                left: -2,
                child: Image.asset(product.imagePath),
              ),
              Positioned(
                top: 45,
                left: 155,
                child: Text(
                  product.name,
                  style: kProductNameOrderTextStyle,
                ),
              ),
              Positioned(
                top: 85,
                left: 155,
                child: Text(
                  size,
                  style: kProductDescTitleTextStyle,
                ),
              ),
              Positioned(
                top: 85,
                left: 215,
                child: Text(
                  product.size,
                  style: kProductDescValueTextStyle,
                ),
              ),
              Positioned(
                top: 110,
                left: 155,
                child: Text(
                  flavor,
                  style: kProductDescTitleTextStyle,
                ),
              ),
              Positioned(
                top: 110,
                left: 215,
                child: Text(
                  product.flavor,
                  style: kProductDescValueTextStyle,
                ),
              ),
              Positioned(
                top: 135,
                left: 155,
                child: Text(
                  topping,
                  style: kProductDescTitleTextStyle,
                ),
              ),
              Positioned(
                top: 135,
                left: 215,
                child: Text(
                  product.topping,
                  style: kProductDescValueTextStyle,
                ),
              ),
              Positioned(
                top: 130,
                left: 80,
                child: Text(
                  money + product.price,
                  style: kPriceTagOrderTextStyle,
                ),
              ),
              Positioned(
                top: 150,
                left: 290,
                child: Controller.to.likes[product.id]
                    ? Image.asset(liked)
                    : Container(),
              ),
            ],
          ),
        );
      },
    );
  }
}
