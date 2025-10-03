import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class AuthService {
  static const _storage = FlutterSecureStorage();
  static const _baseUrl = 'https://tu-backend.com/api';

  static Future<Map<String, dynamic>> login(
    String usuario,
    String contrasena,
  ) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'usuario': usuario, 'contrasena': contrasena}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      await _storage.write(key: 'token', value: data['token']);
      return data; // Devuelve el mapa completo con token, usuario, rol
    }

    return {}; // Login fallido
  }

  static Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  static Future<void> logout() async {
    await _storage.delete(key: 'token');
  }
}
  