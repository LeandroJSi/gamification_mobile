import 'package:get/get.dart';
import 'package:tcc_gamification/data/model/raffle_result.dart';
import 'package:tcc_gamification/data/repository/raffle_repository.dart';

import '../../data/model/response_error.dart';
import '../../shared/widgets/error_dialog.dart';

class RaffleResultController extends GetxController {
  final RaffleRepository injectedRaffleRepository;

  RaffleResultController({required this.injectedRaffleRepository});

  final int raffleId = int.parse(Get.parameters['raffleId']!);
  List<RaffleResult> raffleResultList = [];

  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await getRaffleResult();
    super.onInit();
  }

  Future getRaffleResult() async {
    isLoading.value = true;
    try {
      final result =
          await injectedRaffleRepository.getRaffleResultById(raffleId);
      raffleResultList.addAll(result.data);
    } on ResponseError catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(ErrorDialog(message: e.msg));
      }
    } catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(const ErrorDialog(
            message:
                'Ocorreu um erro desconhecido ao tentar carregar os dados do sorteio, por favor tente novamente.'));
      }
    }
    isLoading.value = false;
  }
}
