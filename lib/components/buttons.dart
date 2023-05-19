import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final Function()? onTap;
  final bool showLoginButton;
  final bool showRegisterButton;

  const Buttons({
    super.key,
    required this.onTap,
    this.showLoginButton = false,
    this.showRegisterButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showLoginButton)
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        const SizedBox(
          height: 10,
        ),
        if (showRegisterButton)
          GestureDetector(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 25),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
