import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://192.168.1.22:5000';

  // =========================
  // LOGIN
  // =========================
  Future<Map<String, dynamic>> login(
    String phone,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phone': phone,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  // =========================
  // REGISTER
  // =========================
  Future<Map<String, dynamic>> register({
    required String ownerName,
    required String ownerPhone,
    required String workshopName,
    required String workshopPhone,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'owner_name': ownerName,
        'owner_phone': ownerPhone,
        'workshop_name': workshopName,
        'workshop_phone': workshopPhone,
        'password': password,
      }),
    );

    return jsonDecode(response.body);
  }

  // =========================
  // VERIFY OTP
  // =========================
  Future<Map<String, dynamic>> verifyOtp(
    String phone,
    String otp,
  ) async {
    final response = await http.post(
      Uri.parse('$baseUrl/verify-otp'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'phone': phone,
        'otp': otp,
      }),
    );

    return jsonDecode(response.body);
  }
}