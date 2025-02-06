import 'package:dartz/dartz.dart';
import '../errors/failures.dart';
import '../models/motel.dart';

abstract class IMotelRepository {
  Future<Either<Failure, Motel>> getMotel();
}
