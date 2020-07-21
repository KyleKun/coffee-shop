import 'package:coffee_shop/screens/add_to_cart/add_to_cart.dart';
import 'package:coffee_shop/screens/add_to_cart/components/rounded_button.dart';
import 'package:coffee_shop/shared/styles/colors.dart';
import 'package:coffee_shop/shared/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Product's details lists
    final List<String> sizeOptions = ['Small', 'Large'];
    final List<String> flavorOptions = ['Caramel', 'Choco +'];
    final List<String> toppingOptions = ['Wipped Cream'];

    return GetBuilder<ProductController>(
      builder: (_) {
        return Container(
          width: 292.0,
          height: 235.0,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: Offset(10, 10),
                color: kProductContainerShadowColor.withOpacity(0.3),
                blurRadius: 6,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              stops: [0.92, 1.0],
              colors: [
                kProductContainerBackgroundColor,
                kProductContainerShadowColor.withOpacity(0.1),
              ],
            ),
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: Column(
            children: [
              SizedBox(height: 10),
              _detailRow(
                'Size',
                0,
                sizeOptions,
                ProductController.to.sizePos,
                120,
              ),
              Divider(),
              _detailRow(
                'Flavor',
                1,
                flavorOptions,
                ProductController.to.flavorPos,
                100,
              ),
              Divider(),
              _detailRow(
                'Topping',
                2,
                toppingOptions,
                ProductController.to.toppingPos,
                70,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _detailRow(
    String title,
    int option,
    List<String> optionsList,
    int pos,
    double buttonPadding,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(width: 50),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: kProductNameOrderTextStyle,
            ),
            Text(
              optionsList[pos],
              style: kProductDetailValueTextStyle,
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: buttonPadding),
          child: RoundedButton(
            icon: Icons.arrow_forward,
            func: () =>
                ProductController.to.changeOption(option, optionsList.length),
          ),
        ),
      ],
    );
  }
}
