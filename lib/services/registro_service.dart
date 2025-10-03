import 'package:http/http.dart' as http;
import 'dart:convert';
import 'auth_service.dart';

class RegistroService {
  static const _baseUrl = 'https://tu-backend.com/api';

  static Future<bool> registrarIngreso(Map<String, dynamic> datos) async {
    final token = await AuthService.getToken();
    final response = await http.post(
      Uri.parse('$_baseUrl/ingreso'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(datos),
    );
    return response.statusCode == 201;
  }

  // Puedes duplicar esta función para salida, visita, limpieza cambiando el endpoint
}

