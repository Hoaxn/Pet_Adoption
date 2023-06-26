import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_adoption_app/components/buttons.dart';
import 'package:pet_adoption_app/components/text_fields.dart';
import 'package:pet_adoption_app/core/app.dart';
import 'package:pet_adoption_app/core/common/my_snackbar.dart';
import 'package:pet_adoption_app/features/auth/domain/entity/user_entity.dart';
import 'package:pet_adoption_app/features/auth/presentation/viewmodel/auth_view_model.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _key = GlobalKey<FormState>();

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // void registerUserIn(BuildContext context) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const LoginScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authViewModelProvider);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          // Image.network(
          //   'https://c4.wallpaperflare.com/wallpaper/772/84/49/dog-shiba-inu-sleeping-wallpaper-preview.jpg',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
          Form(
            key: _key,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [mainColor, secondaryColor],
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
                        "Register Here",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 17,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 50),
                      TextFields(
                        controller: _fnameController,
                        hintText: "First Name",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _lnameController,
                        hintText: "Last Name",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _phoneNumController,
                        hintText: "Phone Number",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _emailController,
                        hintText: "Email",
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      TextFields(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: true,
                      ),
                      const SizedBox(height: 25),
                      Buttons(
                        // onTap: () => registerUserIn(context),
                        onTap: () {
                          if (_key.currentState!.validate()) {
                            var user = UserEntity(
                              firstName: _fnameController.text,
                              lastName: _lnameController.text,
                              phoneNumber: _phoneNumController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );

                            ref
                                .read(authViewModelProvider.notifier)
                                .registerUser(user);

                            if (authState.error != null) {
                              showSnackBar(
                                message: authState.error.toString(),
                                context: context,
                                color: Colors.red,
                              );
                            } else {
                              showSnackBar(
                                message: 'Registered successfully',
                                context: context,
                              );
                            }
                          }
                        },
                        showRegisterButton: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
