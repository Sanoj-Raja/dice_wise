import 'package:get/get.dart';

import 'package:dice_wise/app/modules/home/bindings/home_binding.dart';
import 'package:dice_wise/app/modules/home/views/home_view.dart';
import 'package:dice_wise/app/modules/leader_board/bindings/leader_board_binding.dart';
import 'package:dice_wise/app/modules/leader_board/views/leader_board_view.dart';
import 'package:dice_wise/app/modules/login/bindings/login_binding.dart';
import 'package:dice_wise/app/modules/login/views/login_view.dart';
import 'package:dice_wise/app/modules/splash/bindings/splash_binding.dart';
import 'package:dice_wise/app/modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LEADER_BOARD,
      page: () => LeaderBoardView(),
      binding: LeaderBoardBinding(),
    ),
  ];
}
