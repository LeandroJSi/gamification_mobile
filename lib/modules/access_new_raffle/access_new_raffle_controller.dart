import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/routes/app_routes.dart';

import '../../shared/widgets/error_dialog.dart';

class AccessNewRaffleController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxBool isAccessButtonEnabled = false.obs;

  final RxString password = ''.obs;
  final RxBool passwordFilled = false.obs;

  @override
  void dispose() {
    Get.delete<AccessNewRaffleController>();
  }

  verifyPassword() {
    if (password.value == '@fpgam') {
      Get.offAllNamed(AppRoutes.makeNewRaffle,
          predicate: ModalRoute.withName(AppRoutes.dashboard));
    } else {
      Get.dialog(
          ErrorDialog(message: 'Senha de acesso inválida, tente novamente.'));
    }
  }
}
