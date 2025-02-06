import 'package:dartz/dartz.dart';
import '../errors/failures.dart';
import '../models/motel.dart';
import '../repositories/motel_repository.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}

class GetMotel implements UseCase<Motel> {
  final IMotelRepository repository;

  GetMotel(this.repository);

  @override
  Future<Either<Failure, Motel>> call() async {
    return repository.getMotel();
  }
}
