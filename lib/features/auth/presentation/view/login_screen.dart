import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/components/buttons.dart';
import 'package:pet_adoption_app/components/text_fields.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/features/auth/presentation/view/register_screen.dart';
import 'package:pet_adoption_app/features/auth/presentation/viewmodel/auth_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: 'abcd@example.com');

  final _passwordController = TextEditingController(text: '12345678');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image.network(
          //   'https://c1.wallpaperflare.com/preview/987/846/477/pets-dog.jpg',
          //   fit: BoxFit.cover,
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          // ),
          Form(
            key: _formKey,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ThemeConstant.secondaryColor,
                    ThemeConstant.mainColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
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
                        "Petdoption",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 40,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFields(
                        controller: _emailController,
                        hintText: "Email",
                        obscureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 25),
                      Buttons(
                        // onTap: () => signUserIn(context),
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            await ref
                                .read(authViewModelProvider.notifier)
                                .loginUser(
                                  context,
                                  _emailController.text,
                                  _passwordController.text,
                                );
                          }
                        },
                        showLoginButton: true,
                      ),
                      // const SizedBox(height: 25),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //         child: Divider(
                      //           thickness: 2,
                      //           color: Colors.grey[400],
                      //         ),
                      //       ),
                      //       const Padding(
                      //         padding: EdgeInsets.symmetric(horizontal: 16.0),
                      //         child: Text(
                      //           "Or Continue With",
                      //           style: TextStyle(
                      //             color: Color.fromARGB(255, 0, 0, 0),
                      //             fontSize: 16,
                      //           ),
                      //         ),
                      //       ),
                      //       Expanded(
                      //         child: Divider(
                      //           thickness: 2,
                      //           color: Colors.grey[400],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      const SizedBox(height: 30),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //         border:
                      //             Border.all(color: ThemeConstant.thirdColor),
                      //         borderRadius: BorderRadius.circular(8),
                      //         gradient: const LinearGradient(
                      //           colors: [
                      //             ThemeConstant.thirdColor,
                      //             ThemeConstant.mainColor
                      //           ],
                      //           begin: Alignment.topCenter,
                      //           end: Alignment.bottomCenter,
                      //         ),
                      //       ),
                      //       child: Image.asset(
                      //         'assets/images/google.png',
                      //         height: 60,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not already logged in?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterScreen(),
                              ),
                            ),
                            child: const Text(
                              "Register",
                              style: TextStyle(
                                color: Color.fromARGB(255, 187, 0, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
