import 'package:flutter/material.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/feature/cart/presentation/pages/carts_page.dart';
import 'package:product_list_app/feature/product/presentation/pages/products_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: ThemeColors.clrScaffoldBG,
        appBar: AppBar(
          title: const Text(StringConstants.strProductList),
          elevation: 0,
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(text: StringConstants.strProduct),
              Tab(text: StringConstants.strCarts),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CartsPage(),
            ProductsPage(),
          ],
        ),
      ),
    );
  }
}
