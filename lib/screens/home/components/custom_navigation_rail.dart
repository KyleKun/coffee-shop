import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class CustomNavigationRail extends StatelessWidget {
  // Navigation's Rail smallest size possible
  static const double minWidth = 56.0;

  // Necessary value to center items
  static const double centerAlignment = 0.0;

  // Distance between items
  static const double labelPadding = 10.0;

  // Items
  static const String tea = 'Tea';
  static const String coffee = 'Coffee';
  static const String recent = 'Recent orders';

  /* Builds an item to be displayed */
  NavigationRailDestination _label(String title) {
    return NavigationRailDestination(
      // Used to provide an item without icon
      icon: SizedBox.shrink(),
      label: Padding(
        padding: EdgeInsets.symmetric(vertical: labelPadding),
        // Makes the text vertical
        child: RotatedBox(
          quarterTurns: -1,
          child: Text(title),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      builder: (_) {
        return NavigationRail(
          backgroundColor: kBackgroundColor,
          selectedLabelTextStyle: kSelectedRailLabelTextStyle,
          unselectedLabelTextStyle: kUnselectedRailLabelTextStyle,
          groupAlignment: centerAlignment,
          selectedIndex: Controller.to.railSelectedIndex,
          onDestinationSelected: (int index) {
            Controller.to.setRailIndex(index);
          },
          labelType: NavigationRailLabelType.all,
          minWidth: minWidth,
          destinations: [
            _label(recent),
            _label(tea),
            _label(coffee),
          ],
        );
      },
    );
  }
}
