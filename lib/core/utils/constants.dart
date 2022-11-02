class Constants {
  static const String apiUrl =
      'https://a7c3-2804-431-c7d1-fc80-21f6-b256-80f4-6bba.sa.ngrok.io';
  static Map<String, String> simpleHeaders() => {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkFQUCIsImV4cCI6MTc1NDg2NDI4NCwiaWF0IjoxNjYwMTY5ODg0fQ.at5R-mEMFyIEW2YObyEd0hqI_0l_r9nmsDyHbE7hCNQ'
      };
  static const String serverError =
      'Houve um erro de comunicação com o servidor, por favor tente novamente.';
  static const String serverGatewayTimeout =
      'O servidor demorou para responder, por favor tente novamente.';
}
