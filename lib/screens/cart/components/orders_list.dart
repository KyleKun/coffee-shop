import 'package:coffee_shop/models/product.dart';
import 'package:coffee_shop/screens/cart/components/single_order.dart';
import 'package:flutter/material.dart';

class OrdersList extends StatelessWidget {
  // Products' images
  static const String classicLatte = 'assets/images/products/classic_latte.png';
  static const String espresso = 'assets/images/products/espresso.png';

  final List<Product> ordersList = [
    Product(
      id: 1,
      name: 'Latte',
      price: '2.45',
      size: 'Large',
      flavor: 'Caramel',
      topping: 'Wipped Cream',
      imagePath: classicLatte,
    ),
    Product(
      id: 5,
      name: 'Double Espresso',
      price: '3.00',
      size: 'Small',
      flavor: 'None',
      topping: 'None',
      imagePath: espresso,
    ),
  ];

  Widget _ordersColumn(Product first, Product second) {
    return Column(
      children: [
        SingleOrder(product: first),
        SingleOrder(product: second),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return _ordersColumn(ordersList[0], ordersList[1]);
  }
}
