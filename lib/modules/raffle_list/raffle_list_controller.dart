import 'package:get/get.dart';
import 'package:tcc_gamification/data/model/raffle.dart';
import 'package:tcc_gamification/data/model/raffle_list.dart';
import 'package:tcc_gamification/data/model/response_error.dart';
import 'package:tcc_gamification/data/repository/raffle_repository.dart';

import '../../shared/widgets/error_dialog.dart';

class RaffleListController extends GetxController {
  final RaffleRepository injectedRaffleRepository;

  RaffleListController({required this.injectedRaffleRepository});

  List<Raffle> raffleList = [];
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    await getRaffleList();
    super.onInit();
  }

  getRaffleList() async {
    isLoading.value = true;
    try {
      final RaffleList result = await injectedRaffleRepository.getRaffleList();
      raffleList.addAll(result.data);
    } on ResponseError catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(ErrorDialog(message: e.msg));
      }
    } catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(const ErrorDialog(
            message:
                'Houve um erro ao recuperar a lista de sorteios, por favor tente novamente.'));
      }
    }
    isLoading.value = false;
  }
}
