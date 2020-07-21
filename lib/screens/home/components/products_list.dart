import 'package:coffee_shop/models/product.dart';
import 'package:coffee_shop/screens/home/components/single_product.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatelessWidget {
  // Products' images
  static const String classicLatte = 'assets/images/products/classic_latte.png';
  static const String iced = 'assets/images/products/iced.png';
  static const String americano = 'assets/images/products/americano.png';
  static const String lemonTea = 'assets/images/products/lemon_tea.png';
  static const String espresso = 'assets/images/products/espresso.png';
  static const String cappuccino = 'assets/images/products/cappuccino.png';

  final List<Product> productList = [
    Product(
      id: 1,
      name: 'Classic Latte',
      price: '3.45',
      imagePath: classicLatte,
    ),
    Product(
      id: 2,
      name: 'Iced Caramel\nMocca',
      price: '4.50',
      imagePath: iced,
    ),
    Product(
      id: 3,
      name: 'Classic Americano',
      price: '2.00',
      imagePath: americano,
    ),
    Product(
      id: 4,
      name: 'Hot Lemon Tea',
      price: '1.75',
      imagePath: lemonTea,
    ),
    Product(
      id: 5,
      name: 'Espresso',
      price: '1.30',
      imagePath: espresso,
    ),
    Product(
      id: 6,
      name: 'Cappuccino',
      price: '3.50',
      imagePath: cappuccino,
    ),
  ];

  Widget _productRow(Product first, Product second) {
    return Row(
      children: [
        SingleProduct(product: first),
        SizedBox(width: 15),
        SingleProduct(product: second)
      ],
    );
  }

  SizedBox _rowSpacer() {
    return SizedBox(width: double.infinity, height: 20);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _productRow(
          productList[0],
          productList[1],
        ),
        _rowSpacer(),
        _productRow(
          productList[2],
          productList[3],
        ),
        _rowSpacer(),
        _productRow(
          productList[4],
          productList[5],
        ),
      ],
    );
  }
}
