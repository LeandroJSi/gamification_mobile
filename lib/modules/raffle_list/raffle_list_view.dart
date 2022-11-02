import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/core/utils/date_formatter.dart'
    as date_formatter;
import 'package:tcc_gamification/modules/raffle_list/raffle_list_controller.dart';
import 'package:tcc_gamification/modules/raffle_list/widgets/unique_raffle.dart';
import 'package:tcc_gamification/routes/app_routes.dart';
import 'package:tcc_gamification/shared/widgets/custom_circular_progress_indicator.dart';

class RaffleListView extends GetView<RaffleListController> {
  const RaffleListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listagem de sorteios",
        ),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Get.toNamed(AppRoutes.accessNewRaffle);
              }),
        ],
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : controller.raffleList.isEmpty
                ? Center(
                    child: Text(
                      "Nenhum sorteio foi realizado",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Container(
                          child: ListView.separated(
                            itemCount: controller.raffleList.length,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            separatorBuilder:
                                (BuildContext context, int index) => Divider(),
                            itemBuilder: (BuildContext context, int index) {
                              return UniqueRaffle(
                                raffleId: controller.raffleList[index].id,
                                raffleDate: date_formatter.DateTextFormatter
                                    .dateStringToPtBrWithHmsAndSeparators(
                                        controller.raffleList[index].date),
                              );
                            },
                          ),
                        )
                      ]),
                    ),
                  );
      }),
    );
  }
}
