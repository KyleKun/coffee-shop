import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/add_to_cart/add_to_cart.dart';
import 'screens/cart/cart.dart';
import 'screens/home/home.dart';
import 'theme/style.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/cart', page: () => Cart()),
        GetPage(name: '/add', page: () => AddToCart()),
      ],
    ),
  );
}
