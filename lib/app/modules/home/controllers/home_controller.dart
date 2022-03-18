import 'dart:math';
import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dice_wise/app/constants/app_strings.dart';
import 'package:dice_wise/app/models/user_details_model.dart';
import 'package:dice_wise/app/widgets/loader.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../../constants/app_assest.dart';

class HomeController extends GetxController {
  final DocumentReference _leaderBoardCollectionDocument = FirebaseFirestore
      .instance
      .collection('leader_board')
      .doc(USER_DETAILS.value.userId!);

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
    Loader().showLoadingWidget();

    _leaderBoardCollectionDocument.get().then(
      (document) {
        // Document Already exists just update it.
        if (document.exists) {
          final Map<String, dynamic> updateScoreData = {
            'score': scores.value,
          };
          final oldScore =
              (document.data() as Map<String, dynamic>)['score'] ?? 0;

          if (scores.value > oldScore) {
            _leaderBoardCollectionDocument.update(updateScoreData).then(
              (_) {
                Get.back();
                BotToast.showText(
                  text: AppStrings.scoresUpdatedSuccessfully,
                  duration: Duration(seconds: 3),
                );
              },
            );
          } else {
            Get.back();
            BotToast.showText(
              text: AppStrings.yourHighestScoreIsGreater,
              duration: Duration(seconds: 4),
            );
          }
        }

        // Document not exists create new.
        else {
          Map<String, dynamic> addUserAndScoreData = {
            'name': USER_DETAILS.value.name,
            'score': scores.value,
          };
          _leaderBoardCollectionDocument.set(addUserAndScoreData).then(
            (_) {
              Get.back();
              BotToast.showText(
                text: AppStrings.scoresAddedSuccessfully,
                duration: Duration(seconds: 3),
              );
            },
          );
        }

        _restartGame();
      },
    );
  }

  void _restartGame() {
    scores.value = 0;
    changesToPlay.value = 10;
  }
}
