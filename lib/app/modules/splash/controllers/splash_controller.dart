import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../constants/app_assest.dart';
import '../../../models/user_details_model.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  final logo = AppImages.logo;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(seconds: 2)).then(
      (_) {
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          USER_DETAILS.value = UserDetails(
            name: user.displayName,
            userImage: user.photoURL,
          );
          Get.offAndToNamed(Routes.HOME);
        } else {
          Get.offAndToNamed(Routes.LOGIN);
        }
      },
    );
  }
}
