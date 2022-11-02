import 'package:get/get.dart';
import 'package:tcc_gamification/data/provider/api/http_client.dart';
import 'package:tcc_gamification/data/repository/raffle_repository.dart';
import 'package:tcc_gamification/modules/make_new_raffle/make_new_raffle_controller.dart';

class MakeNewRaffleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MakeNewRaffleController(
        injectedRaffleRepository:
            Get.put(RaffleRepository(injectedHttp: Get.find<HttpClient>()))));
  }
}
