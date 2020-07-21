import 'package:coffee_shop/screens/cart/cart.dart';
import 'package:coffee_shop/screens/home/components/products_list.dart';
import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/widgets/appBars/custom_bottom_app_bar.dart';
import 'package:coffee_shop/shared/widgets/appBars/custom_top_app_bar.dart';
import 'package:coffee_shop/shared/widgets/header_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'components/custom_navigation_rail.dart';

// GetX Controller for state management
class Controller extends GetxController {
  static Controller get to => Get.find();

  int railSelectedIndex = 0;
  int appBarSelectedIndex = 0;

  Map<int, bool> likes = {
    1: false,
    2: false,
    3: false,
    4: false,
    5: false,
    6: false,
  };

  bool isScrolling = false;

  void setRailIndex(int index) {
    railSelectedIndex = index;
    update();
  }

  void setAppBarIndex(int index) {
    appBarSelectedIndex = index;
    update();
  }

  void like(int id) {
    likes[id] = !likes[id];
    update();
  }

  void fadeSearchIcon() {
    isScrolling = !isScrolling;
    update();
  }
}

class Home extends StatelessWidget {
  // Setting up state management with GetX
  final Controller c = Get.put(Controller());

  // List of all products to be shown on home page
  final productList = ProductsList();

  // Makes the top of screen fade the items when scrolling home page
  Shader _scrollShader(Rect rect) {
    return LinearGradient(
      begin: Alignment.center,
      end: Alignment.topCenter,
      colors: [Colors.black, Colors.transparent],
    ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height / 2.5));
  }

  // Gets scroll position to decide whether it should fade or not
  bool _scrollInfo(ScrollUpdateNotification notification) {
    double scrollPosition = notification.metrics.pixels;
    if (scrollPosition > 80 && !c.isScrolling) c.fadeSearchIcon();
    if (scrollPosition < 80 && c.isScrolling) c.fadeSearchIcon();
    return true;
  }

  // Responsible for deciding which screen to build based on bottom appbar index
  Widget _buildScreen(int index, BuildContext context) {
    switch (index) {
      // HOME
      case 0:
        return _showProducts(context);

      /* "Case 1" is dealt by appBar since it goes to a named route instead of
      re-building the content on screen like Home and Cart pages */

      // CART
      case 2:
        return Cart();
      default:
        return _showProducts(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: c,
      builder: (_) {
        return Scaffold(
          backgroundColor: c.appBarSelectedIndex == 0
              ? kBackgroundColor
              : kLightBackgroundColor,
          bottomNavigationBar: CustomBottomAppBar(),
          body: SafeArea(
            child: _buildScreen(c.appBarSelectedIndex, context),
          ),
        );
      },
    );
  }

  // Shows all products if appBar index is 0 (HomeScreen)
  Widget _showProducts(BuildContext context) {
    // Header Text
    final String welcomeText = "Good morning,\nJennifer!";

    return Row(
      children: [
        // Side Menu that shows the options "Recent orders", "Tea" and "Coffee"
        CustomNavigationRail(),
        Expanded(
          child: Container(
            color: Theme.of(context).primaryColor,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    // Applies the shading at the top of home screen
                    return _scrollShader(rect);
                  },
                  blendMode: BlendMode.dstIn,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: NotificationListener<ScrollUpdateNotification>(
                          onNotification: (notification) {
                            // Fades search icon based on scroll position
                            return _scrollInfo(notification);
                          },
                          child: CupertinoScrollbar(
                            child: ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemCount: 1,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    HeaderText(text: welcomeText),
                                    productList,
                                    SizedBox(height: 20)
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTopAppBar(), // Placed at the top of the stack to prevent it of being faded like the products
              ],
            ),
          ),
        ),
      ],
    );
  }
}
