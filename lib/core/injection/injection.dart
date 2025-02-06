import 'package:http/http.dart' as http;

import '../../data/datasources/motel_datasource.dart';
import '../../data/repositories/motel_repository_impl.dart';

final httpClient = http.Client();
final motelDatasource = MotelDatasourceImpl(httpClient);
final motelRepository = MotelRepositoryImpl(datasource: motelDatasource);
