class User {
  final String name;
  final String phone;
  final String email;
  final String birthdate;
  final bool checkInPrize;
  final bool simulationPrize;
  final bool finalPrize;
  final String? luckyNumber;
  final int? status;

  const User(
      {required this.name,
      required this.phone,
      required this.email,
      required this.birthdate,
      required this.checkInPrize,
      required this.simulationPrize,
      required this.finalPrize,
      this.luckyNumber,
      this.status});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      birthdate: json['birthdate'],
      checkInPrize: json['checkin_prize'],
      simulationPrize: json['simulation_prize'],
      finalPrize: json['luckynumber_prize'],
      luckyNumber: json['lucky_number'],
      status: json['status'],
    );
  }
}
