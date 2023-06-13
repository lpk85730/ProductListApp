import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
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
    return BlocBuilder<CheckInternetCubit, CheckInternetState>(
      builder: (context, state) {
        if (state is Online) {
          return const DefaultTabController(
            length: 2,
            child: Scaffold(
              backgroundColor: ThemeColors.clrScaffoldBG,
              body: SafeArea(
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        Tab(text: StringConstants.strProduct),
                        Tab(text: StringConstants.strCarts),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ProductsPage(),
                          CartsPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConstants.strNoInternetText1,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    StringConstants.strNoInternetText2,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
