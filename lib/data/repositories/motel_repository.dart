import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/motel.dart';

class MotelRepository {
  Future<Motel> getMotel() async {
    final http.Client httpClient = http.Client();

    try {
      final response = await httpClient.get(
        Uri.parse('https://api.npoint.io/e728bb91e0cd56cc0711'),
      );
      if (response.statusCode == 200) {
        return Motel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Falha ao carregar dados do motel');
      }
    } finally {
      httpClient.close();
    }
  }
}
