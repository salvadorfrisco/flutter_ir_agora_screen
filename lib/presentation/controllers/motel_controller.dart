import '../../domain/usecases/get_motel.dart';

class MotelController {
  final GetMotel getMotel;

  MotelController(this.getMotel);

  Future<void> loadMotel() async {
    final result = await getMotel();

    result.fold((failure) {
      // Trata o erro
      print('Erro: ${failure.message}');
    }, (motel) {
      // Usa os dados do motel
      print('Motel carregado: ${motel.fantasia}');
    });
  }
}
