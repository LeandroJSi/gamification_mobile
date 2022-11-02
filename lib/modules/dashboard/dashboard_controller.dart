import 'package:get/get.dart';
import 'package:tcc_gamification/data/model/response_error.dart';
import 'package:tcc_gamification/data/repository/qr_code_repository.dart';
import 'package:tcc_gamification/shared/widgets/error_dialog.dart';
import 'package:tcc_gamification/shared/widgets/success_dialog.dart';

class DashboardController extends GetxController {
  final QrCodeRepository injectedQrCodeRepository;

  DashboardController({required this.injectedQrCodeRepository});

  final RxBool isLoading = false.obs;

  Future scanQrCode(String? qrCode) async {
    isLoading.value = true;
    try {
      if (qrCode != null) {
        final result = await injectedQrCodeRepository.scanQrCode(qrCode);
        print(result);
        Get.dialog(SuccessDialog(message: result));
      }
    } on ResponseError catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(ErrorDialog(message: e.msg));
      }
    } catch (e) {
      if (!Get.isDialogOpen!) {
        Get.dialog(const ErrorDialog(
            message:
                'Ocorreu um erro desconhecido ao efetuar a leitura do QR Code, por favor tente novamente.'));
      }
    }
    isLoading.value = false;
  }
}
