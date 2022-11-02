import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tcc_gamification/data/repository/raffle_repository.dart';
import 'package:tcc_gamification/routes/app_routes.dart';

import '../../data/model/response_error.dart';
import '../../shared/widgets/error_dialog.dart';
import '../../shared/widgets/success_dialog.dart';

class MakeNewRaffleController extends GetxController {
  final RaffleRepository injectedRaffleRepository;

  MakeNewRaffleController({required this.injectedRaffleRepository});

  RxInt maxQuantityParticipants = 0.obs;
  RxBool isLoading = false.obs;
  final GlobalKey<FormState> makeNewRaffleFormKey = GlobalKey<FormState>();
  final TextEditingController formController = TextEditingController();

  String? validateParticipantsNumber(String? nroParticipants) {
    if (nroParticipants == "") {
      return 'Preencha o número de participantes';
    }

    var y = int.parse(nroParticipants as String);
    if (y > maxQuantityParticipants.value) {
      return 'Quantidade de participantes excede o total';
    }
    if (y <= 0) {
      return 'É necessário no minimo 1 participante(s) para realizar o sorteio';
    }

    if (y > 45) {
      return 'Os sorteios devem ter no máximo 45 participantes';
    }
    return null;
  }

  @override
  void onInit() async {
    await getMaxQuantityParticipants();
    super.onInit();
  }

  getMaxQuantityParticipants() async {
    isLoading.value = true;
    try {
      final result =
          await injectedRaffleRepository.getMaxQuantityParticipants();
      maxQuantityParticipants.value = result;
    } on ResponseError catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(ErrorDialog(message: e.msg));
      }
    } catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(const ErrorDialog(
            message:
                'Ocorreu um erro desconhecido ao solicitar a quantidade máxima de participantes que o sorteio pode possuir, por favor tente novamente.'));
      }
    }
    isLoading.value = false;
  }

  validateForm() async {
    if (makeNewRaffleFormKey.currentState!.validate()) {
      makeNewRaffleFormKey.currentState!.save();
      await makeNewRaffle();
    }
  }

  makeNewRaffle() async {
    isLoading.value = true;
    try {
      final result = await injectedRaffleRepository
          .makeNewRaffle(int.parse(formController.value.text));
      Get.offAllNamed('${AppRoutes.raffleResult}?raffleId=${result.id}',
          predicate: ModalRoute.withName(AppRoutes.dashboard));
      Get.dialog(
          const SuccessDialog(message: 'Sorteio realizado com sucesso.'));
    } on ResponseError catch (e) {
      Get.back();
      if (!Get.isDialogOpen!) {
        Get.dialog(ErrorDialog(message: e.msg));
      }
    } catch (e) {
      Get.back();
      if (!Get.isDialogOpen!) {
        Get.dialog(const ErrorDialog(
            message:
                'Ocorreu um erro desconhecido ao realizar o sorteio, por favor tente novamente.'));
      }
    }
    isLoading.value = false;
  }
}
