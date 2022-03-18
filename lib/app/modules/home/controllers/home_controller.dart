import 'dart:math';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../constants/app_assest.dart';

class HomeController extends GetxController {
  RxString appVersion = ''.obs;
  List<String> diceImages = [
    AppImages.dice1,
    AppImages.dice2,
    AppImages.dice3,
    AppImages.dice4,
    AppImages.dice5,
    AppImages.dice6,
  ];

  RxInt randomIntForDice = 5.obs;
  RxInt changesToPlay = 10.obs;
  RxInt scores = 0.obs;

  @override
  void onInit() {
    PackageInfo.fromPlatform().then(
      (info) {
        appVersion.value = info.version;
      },
    );

    super.onInit();
  }

  void rollDice() {
    randomIntForDice.value = Random().nextInt(6);
    scores.value += (randomIntForDice.value + 1);
    changesToPlay.value -= 1;
  }

  void submitScores() {
    // TODO: Code for submiting on firebase cloud.
  }
}
