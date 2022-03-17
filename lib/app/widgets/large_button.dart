import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LargeButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;
  final Color? buttonColor;
  final double? buttonHorizontalPadding;
  final String? buttonLeftImage;
  final double height;
  final bool isUpperCaseButtonText;
  final double fontSize;

  const LargeButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.buttonColor,
    this.height = 55,
    this.fontSize = 17,
    this.buttonHorizontalPadding,
    this.buttonLeftImage,
    this.isUpperCaseButtonText = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: buttonHorizontalPadding ?? 15.0,
      ),
      child: ElevatedButton(
        child: SizedBox(
          height: height,
          child: buttonLeftImage == null
              ? Center(
                  child: Text(
                    isUpperCaseButtonText
                        ? buttonText.toUpperCase()
                        : buttonText,
                    style: Get.textTheme.headline2!.copyWith(
                      color: Colors.white,
                      fontSize: fontSize,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: height * .5,
                        width: height * .5,
                        child: Image.asset(
                          buttonLeftImage!,
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            isUpperCaseButtonText
                                ? buttonText.toUpperCase()
                                : buttonText,
                            style: Get.textTheme.headline2!.copyWith(
                              color: Colors.white,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * .5,
                        width: height * .5,
                      ),
                    ],
                  ),
                ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: buttonColor ?? Colors.blue.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
    );
  }
}
