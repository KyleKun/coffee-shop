import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTopAppBar extends StatelessWidget {
  final bool isCart;
  CustomTopAppBar({this.isCart = false});

  // Profile picture properties
  static const double profileContainerSize = 65.0;
  static const String profilePicture = 'assets/images/profile_picture.png';

  // Search icon
  static const String searchIcon = 'assets/images/icons/search_icon.png';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (_) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30, left: isCart ? 56 : 0),
              child: Container(
                width: profileContainerSize,
                height: profileContainerSize,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(profilePicture)),
                  shape: BoxShape.circle,
                  border: Border.all(color: kOrangeBorderColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: kOrangeShadowColor.withOpacity(0.5),
                      blurRadius: 10,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [kOrangeShadowColor, kAccentColor],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 45, top: 20),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: Controller.to.isScrolling ? 0.0 : 1.0,
                child: Image.asset(searchIcon),
              ),
            ),
          ],
        );
      },
    );
  }
}
