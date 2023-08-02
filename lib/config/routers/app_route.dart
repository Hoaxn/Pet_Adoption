import 'package:pet_adoption_app/features/auth/presentation/view/login_screen.dart';
import 'package:pet_adoption_app/features/auth/presentation/view/register_screen.dart';
import 'package:pet_adoption_app/features/home/presentation/view/home_page_screen.dart';
import 'package:pet_adoption_app/features/splash/presentation/view/splash_view.dart';
import 'package:pet_adoption_app/screen/add_pet_screen.dart';
import 'package:pet_adoption_app/screen/liked_pet_screen.dart';

class AppRoute {
  AppRoute._();

  static const String splashRoute = '/splash';
  static const String homeRoute = '/home';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String addPetRoute = '/addPet';
  static const String likedPetRoute = '/likedPet';

  static getApplicationRoute() {
    return {
      splashRoute: (context) => const SplashView(),
      homeRoute: (context) => const HomePageScreen(),
      loginRoute: (context) => const LoginScreen(),
      registerRoute: (context) => const RegisterScreen(),
      addPetRoute: (context) => const AddPetScreen(),
      likedPetRoute: (context) => const LikedPetScreen(),
    };
  }
}
