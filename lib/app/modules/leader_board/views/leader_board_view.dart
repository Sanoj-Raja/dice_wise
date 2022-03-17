import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../../constants/app_strings.dart';
import '../controllers/leader_board_controller.dart';

class LeaderBoardView extends GetView<LeaderBoardController> {
  const LeaderBoardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.leaderBoard),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: DataTable(
              dividerThickness: 1,
              headingTextStyle: Get.textTheme.headline3!.copyWith(
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
              dataTextStyle:
                  Get.textTheme.headline3!.copyWith(color: Colors.black),
              columns: const [
                DataColumn(
                  label: Text(AppStrings.playerName),
                ),
                DataColumn(
                  label: Text(AppStrings.scores),
                ),
              ],
              rows: List.generate(
                17,
                (index) {
                  return DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: Get.width * .6,
                          child: Text(
                            'Saaf no gsdg fgd sdfgfsdg dsfg sg gsdfg sdfg sfdfdg sdfg f',
                            style: Get.textTheme.headline3!.copyWith(
                              color: Colors.black,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(
                          '222',
                          style: Get.textTheme.headline3!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
