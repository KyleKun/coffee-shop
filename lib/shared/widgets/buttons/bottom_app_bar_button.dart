import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:coffee_shop/screens/home/home.dart';

class BottomAppBarButton extends StatelessWidget {
  final int index;
  final String title;
  final String imageActivated;
  final String imageDeactivated;

  BottomAppBarButton({
    @required this.index,
    @required this.title,
    @required this.imageActivated,
    @required this.imageDeactivated,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (_) {
        return FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Controller.to.appBarSelectedIndex == index
                  ? Image.asset(imageActivated)
                  : Image.asset(imageDeactivated),
              SizedBox(height: 8),
              Text(
                Controller.to.appBarSelectedIndex == index ? title : '',
                style: kBottomAppBarButtonTextStyle,
              ),
            ],
          ),
          // Filters Add Item to Cart button
          onPressed: () => (index != 1)
              ? Controller.to.setAppBarIndex(index)
              : Get.toNamed('/add'),
        );
      },
    );
  }
}
