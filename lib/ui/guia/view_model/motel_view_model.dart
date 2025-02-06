import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import '../../../data/repositories/motel_repository_impl.dart';
import '../../../domain/errors/failures.dart';
import '../../../domain/models/motel.dart';

class MotelViewModel extends ChangeNotifier {
  final MotelRepositoryImpl _repository;
  Motel? motel;
  bool isLoading = false;
  String? error;

  MotelViewModel(this._repository);

  Future<void> loadMotel() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      final Either<Failure, Motel> result = await _repository.getMotel();

      result.fold(
        (failure) =>
            error = failure.toString(), // Em caso de erro, armazena a mensagem
        (motelData) =>
            motel = motelData, // Em caso de sucesso, armazena o motel
      );
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void toggleFavorito() {
    if (motel != null) {
      motel!.isFavorito = !motel!.isFavorito;
      notifyListeners();
    }
  }
}
