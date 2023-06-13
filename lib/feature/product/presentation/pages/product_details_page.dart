import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/core/utils/utils.dart';
import 'package:product_list_app/feature/product/domain/entity/product.dart';

class ProductDetailsArguments {
  const ProductDetailsArguments({required this.product});

  final Product product;
}

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({required this.product, super.key});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final imageList = product.images.map(Image.network).toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.strProductDetails),
      ),
      body: Column(
        children: [
          CarouselSlider(
            items: imageList,
            options: CarouselOptions(
              height: 200,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 16),
                Text(
                  '${StringConstants.strPrice}: \$${product.price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  '${StringConstants.strDiscountedPrice}: \$${calculateDiscountPrice(product.price.toDouble(), product.discountPercentage).toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: ThemeColors.clrGreen,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${StringConstants.strRating}: ${product.rating.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  '${StringConstants.strBrandName}: ${product.brand}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  '${StringConstants.strCategory}: ${product.category}',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
