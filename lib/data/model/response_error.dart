class ResponseError {
  final String msg;

  const ResponseError({required this.msg});

  factory ResponseError.fromJson(Map<String, dynamic> json) {
    return ResponseError(msg: json['message']);
  }
}
