import 'package:flutter/material.dart';
import 'package:pet_adoption_app/screen/home_page_screen.dart';

import './screen/menu_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: mainColor,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {'/': (context) => const HomePageScreen()},
    );
  }
}
