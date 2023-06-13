import 'package:flutter/material.dart';
import 'package:product_list_app/core/utils/utils.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //         ProductDetailsPage(product: product),
        //   ),
      },
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                product.thumbnail,
                height: 150,
                width: 110,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 230,
                      child: Text(
                        product.title,
                        maxLines: 5,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: 230,
                      child: Text(
                        product.description,
                        overflow: TextOverflow.fade,
                        maxLines: 5,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Price: \$${product.price.toStringAsFixed(2)}',
                    ),
                    Text(
                      'Discounted Price: \$${calculateDiscountPrice(product.price.toDouble(), product.discountPercentage).toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
