import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/features/auth/presentation/view/register_screen.dart';
import 'package:pet_adoption_app/features/auth/presentation/viewmodel/auth_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController(text: 'abcd@example.com');

  final _passwordController = TextEditingController(text: '12345678');

  bool isObscure = true;

  String image1 = "assets/images/image_1.png";

  String userIcon = "assets/images/user_icon.svg";
  String keyIcon = "assets/images/key_icon.svg";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [ThemeConstant.mainColor, ThemeConstant.secondaryColor],
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(size.height * 0.030),
              child: OverflowBar(
                overflowAlignment: OverflowBarAlignment.center,
                overflowSpacing: size.height * 0.014,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Image.asset(image1),
                  ),
                  Text(
                    "Welcome !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: ThemeConstant.kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "Please, Log In.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: ThemeConstant.kWhiteColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.024),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "Email",
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(userIcon),
                      ),
                      fillColor: ThemeConstant.kWhiteColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(37),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: isObscure,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "Password",
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(keyIcon),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          isObscure
                              ? Icons.visibility
                              : Icons.visibility_off_outlined,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              isObscure = !isObscure;
                            },
                          );
                        },
                      ),
                      fillColor: ThemeConstant.kWhiteColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(37),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter Password';
                      }
                      return null;
                    },
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.080,
                      decoration: BoxDecoration(
                        color: ThemeConstant.kButtonColor,
                        borderRadius: BorderRadius.circular(37),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(
                          color: ThemeConstant.kWhiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async {
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
                  ),
                  SizedBox(height: size.height * 0.0),
                  SvgPicture.asset("assets/images/deisgn.svg"),
                  SizedBox(height: size.height * 0.0),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: size.height * 0.080,
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 45,
                            spreadRadius: 0,
                            color: Color.fromRGBO(120, 37, 139, 0.25),
                            offset: Offset(0, 25),
                          )
                        ],
                        borderRadius: BorderRadius.circular(37),
                        color: const Color.fromRGBO(225, 225, 225, 0.28),
                      ),
                      child: Text(
                        "Create an Account",
                        style: TextStyle(
                          color: ThemeConstant.kWhiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
