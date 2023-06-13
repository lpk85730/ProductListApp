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
      body: ListView.separated(
        itemCount: cart.products.length,
        itemBuilder: (_, index) {
          final product = cart.products[index];
          return Card(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                children: [
                  Text('${product.id}', textAlign: TextAlign.center),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Text(
                          "${StringConstants.strProduct}: \n${product.title}",
                          maxLines: 5,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${StringConstants.strQuantity}: ${product.quantity}',
                              ),
                              Text(
                                '${StringConstants.strPrice}: \$${product.price}',
                              ),
                              Text(
                                '${StringConstants.strTotalAmount}: \$${product.total}',
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${StringConstants.strDiscounted}: ${product.discountPercentage}%",
                              ),
                              Text(
                                "${StringConstants.strDiscountedPrice}: \$${product.discountedPrice}",
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
