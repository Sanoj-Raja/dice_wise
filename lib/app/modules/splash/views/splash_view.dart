import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_strings.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                controller.logo,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                AppStrings.appTitle,
                style: Get.textTheme.headline2!.copyWith(
                  fontSize: 38,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
