import 'package:flutter/material.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/feature/dashboard/presentation/pages/dashboard_page.dart';

class AppRouter {
  Route generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.dashboardPage:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DashboardPage(),
        );

      // case Routes.riskProfileSurveyPage:
      //   final args = routeSettings.arguments as RiskProfileSurveyArguments;
      //   return MaterialPageRoute(
      //     settings: routeSettings,
      //     builder: (_) => RiskProfileSurveyPage(
      //       isUpdateRiskProfile: args.isUpdateRiskProfile,
      //     ),
      //   );

      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => const DashboardPage(),
        );
    }
  }
}
