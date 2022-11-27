import 'package:get/get.dart';
import 'package:tcc_gamification/data/model/user.dart';

import '../../data/model/response_error.dart';
import '../../data/repository/user_repository.dart';
import '../../shared/widgets/error_dialog.dart';

class SearchUserByPhoneResultController extends GetxController {
  final UserRepository injectedUserRepository;

  SearchUserByPhoneResultController({required this.injectedUserRepository});

  RxBool isLoading = false.obs;

  final RxString name = ''.obs;
  final RxString phone = ''.obs;
  final RxString email = ''.obs;
  final RxString birthdate = ''.obs;
  final RxString checkInPrize = ''.obs;
  final RxString simulationPrize = ''.obs;
  final RxString finalPrize = ''.obs;
  final RxString luckyNumber = ''.obs;
  final RxInt status = 0.obs;

  final String phoneParameter = Get.parameters['phone']!;

  @override
  void onInit() async {
    await searchUserByPhone();
    super.onInit();
  }

  searchUserByPhone() async {
    isLoading.value = true;
    try {
      await assignData(
          await injectedUserRepository.searchUserByPhone(phoneParameter));
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
                'Ocorreu um erro desconhecido ao procurar o usuário pelo celular informado, por favor tente novamente.'));
      }
    }
    isLoading.value = false;
  }

  assignData(User user) async {
    name.value = user.name;
    phone.value = user.phone;
    email.value = user.email;
    birthdate.value = user.birthdate;
    checkInPrize.value = user.status! >= 3 ? 'Retirado' : 'Não retirado';
    simulationPrize.value = user.status! >= 5 ? 'Retirado' : 'Não retirado';
    if (user.status == 8) {
      finalPrize.value = 'Retirado';
    }
    if (user.status == 7) {
      finalPrize.value = 'Sorteado';
    }
    luckyNumber.value = user.luckyNumber == null ? '' : user.luckyNumber!;
    status.value = user.status ?? 0;
  }
}
