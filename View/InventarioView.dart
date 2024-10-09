import 'dart:io';

import '../Model/Producto.dart';

class Inventarioview {
  //Funcion que muestra al usuario las opciones del programa
  void menuInventario() {
    print('\n ----------------- Menu Inventario -----------------');
    print('1. Agregar Producto');
    print('2. Buscar Producto');
    print('3. Actualizar Producto');
    print('4. Mostrar valor total de inventario');
    print('5. Mostrar todos los productos');
    print('6. Salir');
  }

  //Funcion que solicita y captura las entradas por teclado que hizo el usuario
  String solicitarDato(String texto) {
    stdout.write(texto);
    try {
      var entrada = stdin.readLineSync();
      return entrada == null ? '' : entrada;
    } catch (e) {
      return '';
    }
  }

  // Funcion que muestra por consolo un mensaje al usuario
  void mensaje(String texto) {
    print(texto);
  }

  //Funcion que muestra todos los productos registrados
  void listarProductos(List<Producto> inventario) {
    if (inventario.isEmpty) {
      mensaje('No hay productos en el inventario');
    } else {
      mensaje('\nListado de productos');
      for (var producto in inventario) {
        print(producto.toString());
      }
    }
  }

  //Esta funcion nos ayuda a determinar si el usuario desea continuar agregando, actualizando o buscando
  bool preguntaContinuar(String mensaje) {
    var respuesta = '';
    do {
      respuesta = solicitarDato("$mensaje (S/N): ");
      respuesta = respuesta.toLowerCase();
    } while (respuesta.toLowerCase() != 's' && respuesta.toLowerCase() != 'n');
    return respuesta == 's';
  }
}
