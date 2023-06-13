import 'package:flutter/material.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';

class CartDetailsArguments {
  const CartDetailsArguments({required this.cart});

  final CartModel cart;
}

class CartDetailsPage extends StatelessWidget {
  const CartDetailsPage({required this.cart, super.key});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.strCartDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart ID: ${cart.id}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'User ID: ${cart.userId}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Total: \$${cart.total}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Total Products: ${cart.totalProducts}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
