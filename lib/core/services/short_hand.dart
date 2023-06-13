import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/core/presentation/cubits/check_internet_cubit/check_internet_cubit.dart';
import 'package:product_list_app/injection_container/injection_container.dart';

class ShortHand {
  static final checkInternetCubit =
      BlocProvider.of<CheckInternetCubit>(sl<BuildContext>());
}
