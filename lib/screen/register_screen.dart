import 'package:flutter/material.dart';
import 'package:pet_adoption_app/components/buttons.dart';
import 'package:pet_adoption_app/components/text_fields.dart';
import 'package:pet_adoption_app/screen/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  void registerUserIn(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          Image.network(
            'https://c4.wallpaperflare.com/wallpaper/772/84/49/dog-shiba-inu-sleeping-wallpaper-preview.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.lock,
                      size: 100,
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Register Here",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextFields(
                      controller: _usernameController,
                      hintText: "Username",
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    TextFields(
                      controller: _passwordController,
                      hintText: "Password",
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    TextFields(
                      controller: _emailController,
                      hintText: "Email",
                      obscureText: false,
                    ),
                    const SizedBox(height: 25),
                    Buttons(
                      onTap: () => registerUserIn(context),
                      showRegisterButton: true,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
