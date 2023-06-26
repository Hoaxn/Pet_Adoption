import 'package:pet_adoption_app/features/auth/presentation/view/login_screen.dart';
import 'package:pet_adoption_app/features/auth/presentation/view/register_screen.dart';
import 'package:pet_adoption_app/features/home/presentation/view/home_page_screen.dart';

class AppRoute {
  AppRoute._();

  // static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';

  static getApplicationRoute() {
    return {
      // splashRoute: (context) => const SplashView(),
      homeRoute: (context) => const HomePageScreen(),
      loginRoute: (context) => const LoginScreen(),
      registerRoute: (context) => const RegisterScreen(),
    };
  }
}
