class Raffle {
  final int id;
  final String date;

  const Raffle({required this.id, required this.date});

  factory Raffle.fromJson(Map<String, dynamic> json) {
    return Raffle(id: json['id'], date: json['date'] ?? json['created_at']);
  }
}
