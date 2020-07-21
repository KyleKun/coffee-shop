import 'package:meta/meta.dart';

class Product {
  final int id;
  final String name;
  final String price;
  final String imagePath;
  final String size;
  final String flavor;
  final String topping;

  Product({
    @required this.id,
    @required this.name,
    @required this.price,
    @required this.imagePath,
    this.size,
    this.flavor,
    this.topping,
  });
}
