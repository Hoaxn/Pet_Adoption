import 'package:flutter/material.dart';
import 'package:pet_adoption_app/config/routers/app_route.dart';

Color mainColor = const Color.fromRGBO(70, 112, 112, 1.0);
Color secondaryColor = const Color.fromRGBO(168, 135, 107, 1.0);

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.loginRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
