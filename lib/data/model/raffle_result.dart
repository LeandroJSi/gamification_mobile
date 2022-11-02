class RaffleResult {
  final int id;
  final String luckyNumber;
  final String name;

  const RaffleResult(
      {required this.id, required this.luckyNumber, required this.name});

  factory RaffleResult.fromJson(Map<String, dynamic> json) {
    return RaffleResult(
        id: json['id'], luckyNumber: json['number'], name: json['name']);
  }
}
