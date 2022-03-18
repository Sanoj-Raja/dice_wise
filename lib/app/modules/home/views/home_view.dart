import 'package:dice_wise/app/models/user_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_strings.dart';
import '../../../widgets/custom_drawer.dart';
import '../../../widgets/image_box.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(
        appVersion: controller.appVersion,
      ),
      appBar: AppBar(
        title: Text(
          '${AppStrings.welcome}, ${USER_DETAILS.value.name}',
          style: Get.textTheme.headline2!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: Colors.black,
        actions: [
          ImageBox(
            imageUrl: USER_DETAILS.value.userImage ?? '',
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 40),
        child: Center(
          child: Obx(
            () => Column(
              children: [
                Flexible(
                  flex: 1,
                  child: Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${AppStrings.scores}: ${controller.scores.value}',
                          style: Get.textTheme.headline2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${AppStrings.chances}: ${controller.changesToPlay.value}',
                          style: Get.textTheme.headline2!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        controller
                            .diceImages[controller.randomIntForDice.value],
                        height: Get.width * .25,
                        width: Get.width * .25,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.black),
                          ),
                          onPressed: controller.changesToPlay.value == 0
                              ? controller.submitScores
                              : controller.rollDice,
                          child: Text(
                            controller.changesToPlay.value == 0
                                ? AppStrings.submitScores
                                : AppStrings.rollDice,
                            style: Get.textTheme.headline2!.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
