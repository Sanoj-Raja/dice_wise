import 'dart:async';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/constants/app_errors.dart';
import 'app/constants/app_strings.dart';
import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runZonedGuarded<Future<void>>(
    () async {
      runApp(
        GetMaterialApp(
          title: AppStrings.appTitle,
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          builder: BotToastInit(),
          navigatorObservers: [BotToastNavigatorObserver()],
          theme: ThemeData(
            primaryColor: Colors.white,
            canvasColor: Colors.white,
            textTheme: const TextTheme(
              headline1: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
              headline2: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              headline3: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    },
    (dynamic error, StackTrace stackTrace) {
      debugPrint('<<----------ERROR--------->> \n$error');
      debugPrint('<<----------STACK TRACE--------->> \n$stackTrace');
      Get.defaultDialog(
        title: AppErrors.errorOccurred,
        titleStyle: Get.textTheme.headline2,
        middleText: AppErrors.unknownErrorDetails,
        middleTextStyle: Get.textTheme.headline3,
        textConfirm: AppStrings.goBack.toUpperCase(),
        confirmTextColor: Colors.white,
        radius: 5,
        buttonColor: Colors.blue,
        onConfirm: () {
          Get.back();
          // One to close the pop up screen.
          // other one for back navigation from the error page.
          Get.back();
        },
      );
    },
  );
}
