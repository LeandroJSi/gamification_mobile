import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/modules/search_user_by_phone_result/search_user_by_phone_result_controller.dart';
import 'package:tcc_gamification/modules/search_user_by_phone_result/widgets/search_result.dart';

import '../../shared/widgets/custom_circular_progress_indicator.dart';
import '../../theme/themes.dart';

class SearchUserByPhoneResultView
    extends GetView<SearchUserByPhoneResultController> {
  const SearchUserByPhoneResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Procurar usuário por Celular",
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Column(
                  children: [
                    SearchResult(
                      name: controller.name.value,
                      phone: controller.phone.value,
                      email: controller.email.value,
                      birthdate: controller.birthdate.value,
                      checkInPrize: controller.checkInPrize.value,
                      simulationPrize: controller.simulationPrize.value,
                      finalPrize: controller.finalPrize.value,
                      luckyNumber: controller.luckyNumber.value,
                      status: controller.status.value,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.searchUserByPhone();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                          primary: TccColors.baseColor),
                      child: const Text(
                        'Recarregar informações',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(40),
                          primary: TccColors.baseColor),
                      child: const Text(
                        'Voltar',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              );
      }),
    );
  }
}
