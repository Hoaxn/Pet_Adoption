class ApiEndpoints {
  ApiEndpoints._();

  static const Duration connectionTimeout = Duration(seconds: 1000);
  static const Duration receiveTimeout = Duration(seconds: 1000);
  static const String baseUrl = "http://localhost:3000/";
  // static const String baseUrl = "http://192.168.1.64:3000/api/v1/";

  // ====================== Auth Routes ======================
  static const String login = "/login";
  static const String register = "/register";
}
