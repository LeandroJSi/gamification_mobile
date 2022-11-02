import 'package:tcc_gamification/core/utils/constants.dart';
import 'package:tcc_gamification/core/utils/error_handler.dart';

import '../provider/api/http_client.dart';

class QrCodeRepository {
  final HttpClient injectedHttp;
  QrCodeRepository({required this.injectedHttp});

  Future<String> scanQrCode(String qrCode) async {
    try {
      final response = await injectedHttp.post(
          url: "${injectedHttp.apiUrl()}/api/qrcode-read",
          header: Constants.simpleHeaders(),
          body: {"qrcode": qrCode});
      if (response.statusCodeIsOk) return response.body['message'];
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }
}
