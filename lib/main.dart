import 'package:flutter/material.dart';
import 'package:product_list_app/entry.dart';
import 'package:product_list_app/injection_container/injection_container.dart';

Future<void> main() async {
  await init();
  runApp(const Entry());
}
