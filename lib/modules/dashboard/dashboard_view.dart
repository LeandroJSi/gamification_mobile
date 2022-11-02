import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/modules/dashboard/dashboard_controller.dart';
import 'package:tcc_gamification/shared/widgets/custom_circular_progress_indicator.dart';

import '../../core/utils/qr_code_scanner.dart';
import '../../shared/widgets/custom_drawer.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Feira das Profissões",
        ),
      ),
      drawer: const CustomDrawer(),
      body: Obx(() {
        return controller.isLoading.value
            ? CustomCircularProgressIndicator()
            : Center(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(QrCodeScanner(controller.scanQrCode));
                        },
                        child: Image.asset(
                          // width: double.infinity,
                          "images/qr_code.png",
                          height: 150,
                        ),
                      ),
                      const Text(
                        "Pressione sobre o ícone para realizar a leitura do Qr Code",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
      }),
    );
  }
}
