import 'package:get/get.dart';
import 'package:tcc_gamification/modules/access_new_raffle/access_new_raffle_controller.dart';

class AccessNewRaffleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccessNewRaffleController());
  }
}
