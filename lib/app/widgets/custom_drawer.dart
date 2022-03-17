import 'package:dice_wise/app/constants/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_errors.dart';
import '../models/user_details_model.dart';
import '../routes/app_pages.dart';
import 'image_box.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.topLeft,
                colors: [
                  Colors.white,
                  Colors.grey,
                  Colors.black,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  ImageBox(imageUrl: USER_DETAILS.value.userImage ?? ''),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: Get.width * .4,
                      child: Text(
                        USER_DETAILS.value.name ?? '',
                        style: Get.textTheme.headline2!.copyWith(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              AppStrings.leaderBoard,
              style: Get.textTheme.headline3!.copyWith(
                color: Colors.black,
              ),
            ),
            leading: const Icon(
              Icons.add_chart_sharp,
              color: Colors.black,
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.black,
            ),
            onTap: () {
              Get.toNamed(Routes.LEADER_BOARD);
            },
          ),
          ListTile(
            title: Text(
              AppStrings.logout,
              style: Get.textTheme.headline3!.copyWith(
                color: Colors.black,
              ),
            ),
            leading: const Icon(
              Icons.logout,
              color: Colors.black,
            ),
            trailing: const Icon(
              Icons.chevron_right,
              color: Colors.black,
            ),
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                (_) {
                  USER_DETAILS.value = UserDetails();
                  Get.offAllNamed(Routes.SPLASH);
                },
              ).catchError(
                (_error) {
                  Get.snackbar(
                    AppErrors.signoutError,
                    AppErrors.signoutErrorDetails,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
