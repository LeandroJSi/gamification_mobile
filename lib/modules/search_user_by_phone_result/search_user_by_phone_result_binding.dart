import 'package:get/get.dart';
import 'package:tcc_gamification/data/provider/api/http_client.dart';
import 'package:tcc_gamification/data/repository/user_repository.dart';
import 'package:tcc_gamification/modules/search_user_by_phone_result/search_user_by_phone_result_controller.dart';

class SearchUserByPhoneResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchUserByPhoneResultController(
        injectedUserRepository:
            Get.put(UserRepository(injectedHttp: Get.find<HttpClient>()))));
  }
}
