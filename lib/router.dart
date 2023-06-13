import 'package:flutter/material.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/feature/cart/presentation/pages/carts_details_page.dart';
import 'package:product_list_app/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'package:product_list_app/feature/product/presentation/pages/product_details_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.dashboardPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DashboardPage(),
        );

      case Routes.productDetailPage:
        final args = routeSettings.arguments as ProductDetailsArguments;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => ProductDetailsPage(product: args.product),
        );

      case Routes.cartsDetailPage:
        final args = routeSettings.arguments as CartDetailsArguments;
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => CartDetailsPage(cart: args.cart),
        );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DashboardPage(),
        );
    }
  }
}
