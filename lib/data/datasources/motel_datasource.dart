import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/motel.dart';

abstract class MotelDatasource {
  Future<Motel> getMotel();
}

class MotelDatasourceImpl implements MotelDatasource {
  final http.Client client;
  final String baseUrl = 'https://api.npoint.io';

  MotelDatasourceImpl(this.client);

  @override
  Future<Motel> getMotel() async {
    final response =
        await client.get(Uri.parse('$baseUrl/e728bb91e0cd56cc0711'));

    if (response.statusCode == 200) {
      return Motel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Falha ao carregar dados do motel');
    }
  }
}
