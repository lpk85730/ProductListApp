import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/constants/string_constants.dart';
import 'package:product_list_app/core/constants/theme_constants.dart';
import 'package:product_list_app/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:product_list_app/feature/dashboard/presentation/pages/dashboard_page.dart';
import 'package:product_list_app/injection_container/injection_container.dart';

class Entry extends StatelessWidget {
  const Entry({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<CheckInternetCubit>(),
          lazy: false,
        ),
        //BlocProvider(create: (context) => sl<LanguageSelectionCubit>()),
      ],
      child: MaterialApp(
        title: StringConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ThemeColors.clrWhite,
          primaryColorLight: ThemeColors.clrWhite,
          primaryColorDark: ThemeColors.clrWhite,
          canvasColor: ThemeColors.clrWhite,
          appBarTheme: AppTheme.appBarTheme(),
          textTheme: AppTheme.textTheme(context),
          buttonTheme: AppTheme.buttonThemeData(context),
          elevatedButtonTheme: AppTheme.elevatedButtonThemeData(),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(background: ThemeColors.clrWhite),
        ),
        home: const DashboardPage(),
      ),
    );
  }
}
