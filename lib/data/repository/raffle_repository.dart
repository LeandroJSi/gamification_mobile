import 'package:tcc_gamification/data/model/raffle_list.dart';
import 'package:tcc_gamification/data/model/raffle_result_list.dart';

import '../../core/utils/constants.dart';
import '../../core/utils/error_handler.dart';
import '../model/raffle.dart';
import '../provider/api/http_client.dart';

class RaffleRepository {
  final HttpClient injectedHttp;

  RaffleRepository({required this.injectedHttp});

  Future<RaffleList> getRaffleList() async {
    try {
      final response = await injectedHttp.get(
          url: "${injectedHttp.apiUrl()}/api/raffles",
          header: Constants.simpleHeaders());
      if (response.statusCodeIsOk) return RaffleList.fromJson(response.body);
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getMaxQuantityParticipants() async {
    try {
      final response = await injectedHttp.get(
          url: "${injectedHttp.apiUrl()}/api/lucky-number-count",
          header: Constants.simpleHeaders());
      if (response.statusCodeIsOk) {
        return response.body['total'];
      }
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<Raffle> makeNewRaffle(int qtParticipants) async {
    try {
      final response = await injectedHttp.post(
          url: "${injectedHttp.apiUrl()}/api/new-raffle",
          header: Constants.simpleHeaders(),
          body: {'quantity': qtParticipants});
      if (response.statusCodeIsOk) {
        return Raffle.fromJson(response.body['raffle']);
      }
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<RaffleResultList> getRaffleResultById(int raffleId) async {
    try {
      final response = await injectedHttp.get(
          url:
              "${injectedHttp.apiUrl()}/api/raffle-numbers?raffle_number=$raffleId",
          header: Constants.simpleHeaders());
      if (response.statusCodeIsOk) {
        return RaffleResultList.fromJson(response.body);
      }
      print(response.statusCode);
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> notifyRaffle() async {
    try {
      final response = await injectedHttp.post(
          url: "${injectedHttp.apiUrl()}/api/notify-raffle",
          header: Constants.simpleHeaders(),
          body: {});
      if (response.statusCodeIsOk) {
        return response.body['message'];
      }
      throw ErrorHandler.getStatusError(response);
    } catch (e) {
      rethrow;
    }
  }
}
