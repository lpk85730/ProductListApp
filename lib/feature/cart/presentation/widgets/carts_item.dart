import 'package:flutter/material.dart';
import 'package:one_context/one_context.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/feature/cart/data/model/carts_model.dart';
import 'package:product_list_app/feature/cart/presentation/pages/carts_details_page.dart';

class CartsItem extends StatelessWidget {
  const CartsItem({required this.cart, super.key});

  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        OneContext().pushNamed(
          Routes.cartsDetailPage,
          arguments: CartDetailsArguments(cart: cart),
        );
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Row(
            children: [
              Text('${cart.id}', textAlign: TextAlign.center),
              const SizedBox(width: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${StringConstants.strTotalProduct}: ${cart.totalProducts}',
                  ),
                  Text('${StringConstants.strUserID}: ${cart.userId}')
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  const Text(StringConstants.strTotalAmount),
                  Text('\$${cart.total}'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
