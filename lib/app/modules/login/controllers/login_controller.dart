import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../constants/app_errors.dart';
import '../../../models/user_details_model.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  void clickToSignInWithGoogle() {
    _signInWithGoogle().then(
      (user) {
        if (user != null) {
          USER_DETAILS.value = UserDetails(
            name: user.displayName,
            userImage: user.photoURL,
            userId: user.uid,
          );
          Get.offAndToNamed(Routes.HOME);
        }
      },
    );
  }

  Future<User?> _signInWithGoogle() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try {
        final UserCredential userCredential =
            await auth.signInWithCredential(authCredential);

        user = userCredential.user;
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          Get.snackbar(
            AppErrors.accountAlreadyExistsError,
            AppErrors.accountAlreadyExistsErrorDetails,
          );
        }
      } catch (e) {
        Get.snackbar(
          AppErrors.signInError,
          AppErrors.signInErrorDetails,
        );
      }
    }
    return user;
  }
}
