import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

class BlobService {
  static Future<String?> subirFoto(XFile foto) async {
    final dio = Dio();
    final formData = FormData.fromMap({
      'file': await MultipartFile.fromFile(foto.path),
    });

    final response = await dio.post(
      'https://tu-backend.com/api/upload',
      data: formData,
    );

    if (response.statusCode == 200) {
      return response.data['url']; // URL de Azure Blob
    }
    return null;
  }
}

