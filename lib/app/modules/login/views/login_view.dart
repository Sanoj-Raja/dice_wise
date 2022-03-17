import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_assest.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/large_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: Image.asset(AppImages.logo),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  AppStrings.welcomeText,
                  style: Get.textTheme.headline3!.copyWith(
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              LargeButton(
                buttonText: AppStrings.signInWithGoogle,
                onPressed: controller.googleSignIn,
                isUpperCaseButtonText: false,
                buttonLeftImage: AppImages.google,
                fontSize: 20,
                buttonColor: Colors.black.withOpacity(.9),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
