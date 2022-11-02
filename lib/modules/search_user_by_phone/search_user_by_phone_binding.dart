import 'package:get/get.dart';
import 'package:tcc_gamification/modules/search_user_by_phone/search_user_by_phone_controller.dart';

class SearchUserByPhoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchUserByPhoneController());
  }
}
