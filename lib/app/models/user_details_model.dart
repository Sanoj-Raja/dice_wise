// ignore_for_file: non_constant_identifier_names

import 'package:get/get.dart';

Rx<UserDetails> USER_DETAILS = UserDetails().obs;

class UserDetails {
  String? name;
  String? userImage;
  String? userId;

  UserDetails({
    this.name,
    this.userImage,
    this.userId,
  });
}
