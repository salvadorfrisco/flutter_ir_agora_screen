import 'package:http/http.dart' as http;

import '../../data/datasources/motel_datasource.dart';
import '../../data/repositories/motel_repository_impl.dart';
import '../../domain/usecases/get_motel.dart';
import '../../presentation/controllers/motel_controller.dart';

final httpClient = http.Client();
final motelDatasource = MotelDatasourceImpl(httpClient);
final motelRepository = MotelRepositoryImpl(datasource: motelDatasource);
final getMotel = GetMotel(motelRepository);
final motelController = MotelController(getMotel);
