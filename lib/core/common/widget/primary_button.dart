import 'package:flutter/material.dart';
import 'package:pet_adoption_app/config/constants/theme_constant.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final double? verticalPadding;
  final double? buttonWidth;
  const PrimaryButton({
    super.key,
    required this.text,
    this.verticalPadding,
    required this.onPressed,
    this.buttonWidth,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: ThemeConstant.mainColor.withOpacity(0.1), // Shadow color
            blurRadius: 4, // Spread radius
            offset: const Offset(0, 2), // Shadow offset
          ),
        ],
      ),
      width: buttonWidth ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ThemeConstant
              .secondaryColor, // Replace with your desired background color
          padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? 16.00,
              horizontal: 24.0), // Replace with your desired padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Add border radius
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: isLoading ? 0.0 : 1.0,
              child: Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (isLoading)
              const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  strokeWidth: 2.0,
                ),
              ),
          ],
        ),

        // child: Text(
        //    CircularProgressIndicator(
        //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        //     ),
        //   style: const TextStyle(
        //     fontWeight: FontWeight.bold, // Make the text bold
        //   ),
        // ),
      ),
    );
  }
}
