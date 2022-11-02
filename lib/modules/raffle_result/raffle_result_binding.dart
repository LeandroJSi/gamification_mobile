import 'package:get/get.dart';
import 'package:tcc_gamification/data/provider/api/http_client.dart';
import 'package:tcc_gamification/data/repository/raffle_repository.dart';
import 'package:tcc_gamification/modules/raffle_result/raffle_result_controller.dart';

class RaffleResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
        () => RaffleResultController(
            injectedRaffleRepository: Get.put(
                RaffleRepository(injectedHttp: Get.find<HttpClient>()))),
        fenix: true);
  }
}
