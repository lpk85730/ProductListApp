import 'package:flutter/material.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';

class CartsItem extends StatelessWidget {
  const CartsItem({required this.cart, super.key});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: ThemeColors.clrBlack,
    );
  }
}
