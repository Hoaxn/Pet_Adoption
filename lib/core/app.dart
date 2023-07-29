import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/config/routers/app_route.dart';
import 'package:pet_adoption_app/config/themes/app_theme.dart';
import 'package:pet_adoption_app/core/common/provider/is_dark_theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkTheme = ref.watch(isDarkThemeProvider);
    return MaterialApp(
      theme: AppTheme.getApplicationTheme(isDarkTheme),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoute.splashRoute,
      routes: AppRoute.getApplicationRoute(),
    );
  }
}
