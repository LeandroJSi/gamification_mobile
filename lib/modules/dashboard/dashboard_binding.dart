import 'package:get/get.dart';

import '../../data/provider/api/http_client.dart';
import '../../data/repository/qr_code_repository.dart';
import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController(
        injectedQrCodeRepository:
            Get.put(QrCodeRepository(injectedHttp: Get.find<HttpClient>()))));
  }
}
