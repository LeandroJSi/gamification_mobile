import 'package:tcc_gamification/core/utils/constants.dart';
import 'package:tcc_gamification/data/model/user.dart';

import '../../core/utils/error_handler.dart';
import '../provider/api/http_client.dart';

class UserRepository {
  final HttpClient injectedHttp;

  UserRepository({required this.injectedHttp});

  Future<User> searchUserByPhone(String phone) async {
    try {
      final response = await injectedHttp.get(
        url: "${injectedHttp.apiUrl()}/api/consult-users?phone=$phone",
        header: Constants.simpleHeaders(),
      );
      if (response.statusCodeIsOk) return User.fromJson(response.body);
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }
}
