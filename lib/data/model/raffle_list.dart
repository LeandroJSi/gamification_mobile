import 'package:tcc_gamification/data/model/raffle.dart';

class RaffleList {
  final List<Raffle> data;

  const RaffleList({required this.data});

  factory RaffleList.fromJson(Map<String, dynamic> json) {
    return RaffleList(
        data:
            List<Raffle>.from(json['raffles'].map((x) => Raffle.fromJson(x))));
  }
}
