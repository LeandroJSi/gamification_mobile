import 'package:get/get.dart';
import 'package:tcc_gamification/data/repository/raffle_repository.dart';
import 'package:tcc_gamification/modules/raffle_list/raffle_list_controller.dart';

import '../../data/provider/api/http_client.dart';

class RaffleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RaffleListController(
        injectedRaffleRepository:
            Get.put(RaffleRepository(injectedHttp: Get.find<HttpClient>()))));
  }
}
