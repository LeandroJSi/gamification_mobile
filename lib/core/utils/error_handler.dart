import 'package:tcc_gamification/data/provider/api/interface_http_client.dart';

import '../../data/model/response_error.dart';
import 'constants.dart';

class ErrorHandler {
  static getStatusError(HttpClientResponse response) {
    if (response.statusCodeIsBadRequest) {
      return ResponseError.fromJson(response.body);
    }
    if (response.statusCodeIsServerError) {
      return const ResponseError(msg: Constants.serverError);
    }
    if (response.statusCodeIsServerTimeout) {
      return const ResponseError(msg: Constants.serverGatewayTimeout);
    }
    return Exception("Error");
  }
}
