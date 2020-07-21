import 'package:coffee_shop/screens/add_to_cart/components/product_details_container.dart';
import 'package:coffee_shop/screens/add_to_cart/components/product_image.dart';
import 'package:coffee_shop/screens/add_to_cart/components/quantity_row.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:coffee_shop/shared/widgets/buttons/gradient_orange_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// GetX product controller
class ProductController extends GetxController {
  static ProductController get to => Get.find();

  // Product's details
  int quantity = 1;
  int sizePos = 1;
  int flavorPos = 0;
  int toppingPos = 0;

  void increaseQuantity() {
    if (quantity < 99) quantity++;
    update();
  }

  void decreaseQuantity() {
    if (quantity > 1) quantity--;
    update();
  }

  // Handles Size, Flavor and Topping changes based on the length of each option list
  void changeOption(int option, int length) {
    if (option == 0)
      changeSize(length);
    else if (option == 1)
      changeFlavor(length);
    else if (option == 2) changeTopping(length);
    update();
  }

  void changeSize(int lenght) {
    if (sizePos < lenght - 1) {
      sizePos++;
    } else {
      sizePos = 0;
    }
  }

  void changeFlavor(int lenght) {
    if (flavorPos < lenght - 1) {
      flavorPos++;
    } else {
      flavorPos = 0;
    }
  }

  void changeTopping(int lenght) {
    if (toppingPos < lenght - 1) {
      toppingPos++;
    } else {
      toppingPos = 0;
    }
  }
}

class AddToCart extends StatelessWidget {
  // Init controller
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: productController,
      builder: (_) {
        return Scaffold(
          backgroundColor: Theme.of(context).primaryColorLight,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            // The background color is slightly different from home screen
            color: Theme.of(context).primaryColorLight,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.topCenter,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 80),
                      // Image
                      ProductImage(),
                      SizedBox(height: 25),
                      // Title
                      _title(context),
                      SizedBox(height: 10),
                      // Price
                      _price(),
                      SizedBox(height: 10),
                      // Details
                      ProductDetailsContainer(),
                      SizedBox(height: 30),
                      // Quantity
                      QuantityRow(),
                      SizedBox(height: 20),
                      // Button
                      _addToCartButton(),
                      SizedBox(height: 40),
                    ],
                  ),
                ),
                Positioned(
                  top: 60,
                  right: 45,
                  child: _closeButton(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _closeButton() {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Image.asset('assets/images/icons/close.png'),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      'Classic Latte',
      style: Theme.of(context).textTheme.headline6,
    );
  }

  Text _price() {
    return Text('\$ 4.50', style: kItemPriceTextStyle);
  }

  Widget _addToCartButton() {
    return GestureDetector(
      onTap: () => Get.toNamed('/cart'),
      child: GradientOrangeButton(
        title: 'add to cart',
      ),
    );
  }
}
