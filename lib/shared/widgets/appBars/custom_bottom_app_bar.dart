import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/widgets/buttons/bottom_app_bar_button.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  // BOTTOM APPBAR PROPERTIES
  static const double height = 75.0;
  static const double borderRadius = 15.0;
  static const double blurRadius = 25.0;

  // BUTTONS PROPERTIES
  // HOME
  static const String homeTitle = 'HOME';
  static const String homeImageOn = 'assets/images/icons/home_on.png';
  static const String homeImageOff = 'assets/images/icons/home_off.png';
  // CART
  static const String cartTitle = 'CART';
  static const String cartImageOn = 'assets/images/icons/cart_on.png';
  static const String cartImageOff = 'assets/images/icons/cart_off.png';
  // ADD
  static const String addImage = 'assets/images/icons/add.png';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: kBottomAppBarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          topLeft: Radius.circular(borderRadius),
        ),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: blurRadius),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomAppBarButton(
            index: 0,
            title: homeTitle,
            imageActivated: homeImageOn,
            imageDeactivated: homeImageOff,
          ),
          BottomAppBarButton(
            index: 1,
            title: '',
            imageActivated: addImage,
            imageDeactivated: addImage,
          ),
          BottomAppBarButton(
            index: 2,
            title: cartTitle,
            imageActivated: cartImageOn,
            imageDeactivated: cartImageOff,
          ),
        ],
      ),
    );
  }
}
