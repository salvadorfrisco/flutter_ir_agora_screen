import 'package:flutter/foundation.dart';
import '../../../domain/models/motel.dart';
import '../../../data/repositories/motel_repository.dart';

class MotelViewModel extends ChangeNotifier {
  final MotelRepository _repository;
  Motel? motel;
  bool isLoading = false;
  String? error;

  MotelViewModel(this._repository);

  Future<void> loadMotel() async {
    isLoading = true;
    error = null;
    notifyListeners();

    try {
      motel = await _repository.getMotel();
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
