import 'dart:io';

import '../Model/Categoria.dart';

class Categoriaview {
  void menu(List<Categoria> categorias) {
    print('\n ----------------- Selecciona Categoria-----------------------');
    for (Categoria categoria in categorias) {
      print(categoria);
    }
  }

  Categoria seleccionarCategoria(List<Categoria> categorias) {
    while (true) {
      stdout.write('Seleccione una categoría (ingrese un número): ');
      String? opcion = stdin.readLineSync();

      try {
        int indice = int.parse(opcion!);
        var categoria = categorias.firstWhere((c) => c.id == indice);
        return categoria;
      } catch (e) {
        print('Entrada inválida. Ingrese un número entero válido.');
      }
    }
  }
}
