import 'package:dartz/dartz.dart';
import '../../domain/models/motel.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/motel_repository.dart';
import '../datasources/motel_datasource.dart';

class MotelRepositoryImpl implements IMotelRepository {
  final MotelDatasource datasource;

  MotelRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, Motel>> getMotel() async {
    try {
      final motel = await datasource.getMotel();
      return Right(motel);
    } catch (e) {
      return Left(ServerFailure('Erro ao buscar dados do motel'));
    }
  }
}
