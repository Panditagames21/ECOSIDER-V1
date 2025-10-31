import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'https://tu-backend.com/api';

  static Future<bool> login(String usuario, String contrasena) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {'usuario': usuario, 'contrasena': contrasena},
    );
    return response.statusCode == 200;
  }
}
