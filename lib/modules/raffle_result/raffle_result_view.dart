import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/modules/raffle_result/raffle_result_controller.dart';

import '../../shared/widgets/custom_circular_progress_indicator.dart';

class RaffleResultView extends GetView<RaffleResultController> {
  const RaffleResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Resultado do sorteio ${controller.raffleId.toString()}",
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : controller.raffleResultList.isEmpty
                ? Center(
                    child: Text(
                      "Não foi possível obter os dados desse sorteio, por favor tente novamente.",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 12),
                    child: SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sorteados",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 22),
                            ),
                            Container(
                              child: ListView.separated(
                                itemCount: controller.raffleResultList.length,
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        Divider(),
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller
                                              .raffleResultList[index].name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 20),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          controller.raffleResultList[index]
                                              .luckyNumber,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
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
