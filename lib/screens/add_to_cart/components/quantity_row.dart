import 'package:coffee_shop/screens/add_to_cart/add_to_cart.dart';
import 'package:coffee_shop/screens/add_to_cart/components/rounded_button.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (_) {
        return Container(
          width: 220,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedButton(
                icon: Icons.remove,
                func: () => ProductController.to.decreaseQuantity(),
              ),
              Container(
                width: 45,
                height: 45,
                child: Center(
                  child: Text(
                    ProductController.to.quantity.toString(),
                    style: kItemQuantityTextStyle,
                  ),
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              RoundedButton(
                icon: Icons.add,
                func: () => ProductController.to.increaseQuantity(),
              ),
            ],
          ),
        );
      },
    );
  }
}
