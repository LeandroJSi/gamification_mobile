import 'package:tcc_gamification/data/model/raffle_result.dart';

class RaffleResultList {
  final List<RaffleResult> data;

  const RaffleResultList({required this.data});

  factory RaffleResultList.fromJson(Map<String, dynamic> json) {
    return RaffleResultList(
        data: List<RaffleResult>.from(
            json['luckyNumbers'].map((x) => RaffleResult.fromJson(x))));
  }
}
