import 'package:cloud_firestore/cloud_firestore.dart';
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
      body: Obx(
        () => StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('leader_board')
              .orderBy(
                'score',
                descending: controller.isAscending.value,
              )
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return LinearProgressIndicator();
            return SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: DataTable(
                    sortAscending: controller.isAscending.value,
                    sortColumnIndex: controller.currentSortColumn.value,
                    dividerThickness: 1,
                    headingTextStyle: Get.textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    dataTextStyle:
                        Get.textTheme.headline3!.copyWith(color: Colors.black),
                    columns: [
                      const DataColumn(
                        label: Text(AppStrings.playerName),
                      ),
                      DataColumn(
                        label: Text(AppStrings.scores),
                        numeric: true,
                        onSort: (columnIndex, _) {
                          controller.currentSortColumn.value = columnIndex;
                          controller.isAscending.toggle();
                        },
                      ),
                    ],
                    rows: snapshot.data!.docs.map(
                      (playerDetails) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Text(
                                playerDetails['name'],
                                style: Get.textTheme.headline3!.copyWith(
                                  color: Colors.black,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            DataCell(
                              Text(
                                playerDetails['score'].toString(),
                                style: Get.textTheme.headline3!.copyWith(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
