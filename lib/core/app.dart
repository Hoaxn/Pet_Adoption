import 'package:flutter/material.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/config/routers/app_route.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ThemeConstant.mainColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.homeRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
