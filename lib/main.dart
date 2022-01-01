import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'view/splash_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    home: SplashScreen(),
    );
  }
}

