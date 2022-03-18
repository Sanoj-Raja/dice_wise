import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_errors.dart';

class Loader {
  static final Loader _instance = Loader._internal();

  factory Loader() {
    return _instance;
  }

  Loader._internal();

  Future<dynamic> showLoadingWidget() => showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (context) => Center(
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: Colors.white.withOpacity(.85),
            ),
            width: 75,
            height: 75,
            child: CircularProgressIndicator(
              strokeWidth: 1.5,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.black,
              ),
            ),
          ),
        ),
      );

  Widget showNoDataFound({String? message}) => Center(
        child: Text(
          message ?? AppErrors.nothingFound,
          style: Get.textTheme.headline2,
        ),
      );
}
