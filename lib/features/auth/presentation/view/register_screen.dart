import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';
import 'package:pet_adoption_app/features/auth/domain/entity/user_entity.dart';
import 'package:pet_adoption_app/features/auth/presentation/viewmodel/auth_view_model.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterScreen> {
  final _key = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneNumController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isObscure = true;

  String image1 = "assets/images/image_1.png";

  String userIcon = "assets/images/user_icon.svg";
  String keyIcon = "assets/images/key_icon.svg";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _key,
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
                    "Hi There !",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: ThemeConstant.kWhiteColor.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    "Let's Get Started",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                      color: ThemeConstant.kWhiteColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.024),
                  TextFormField(
                    controller: _firstNameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "First Name",
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
                        return 'Please Enter a First Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _lastNameController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "Last Name",
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
                        return 'Please Enter a Last Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _phoneNumController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "Phone Number",
                      prefixIcon: const Icon(
                        Icons.phone_iphone,
                      ),
                      fillColor: ThemeConstant.kWhiteColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(37),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Phone Number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _cityController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "City",
                      prefixIcon: const Icon(
                        Icons.location_city,
                      ),
                      fillColor: ThemeConstant.kWhiteColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(37),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a City';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _countryController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: ThemeConstant.kInputColor),
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(vertical: 25.0),
                      filled: true,
                      hintText: "Country",
                      prefixIcon: const Icon(
                        Icons.location_city,
                      ),
                      fillColor: ThemeConstant.kWhiteColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(37),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Country';
                      }
                      return null;
                    },
                  ),
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
                        return 'Please Enter an Email';
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
                        return 'Please Enter a Password';
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
                        "Create an Account",
                        style: TextStyle(
                          color: ThemeConstant.kWhiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      if (_key.currentState!.validate()) {
                        var user = UserEntity(
                          firstName: _firstNameController.text,
                          lastName: _lastNameController.text,
                          phoneNumber: _phoneNumController.text,
                          city: _cityController.text,
                          country: _countryController.text,
                          email: _emailController.text,
                          password: _passwordController.text,
                          // image:
                          //     ref.read(authViewModelProvider).imageName ?? '',
                        );

                        ref
                            .read(authViewModelProvider.notifier)
                            .registerUser(context, user);
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
                        "Login",
                        style: TextStyle(
                          color: ThemeConstant.kWhiteColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
