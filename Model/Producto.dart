import 'Categoria.dart';

class Producto {
  /*Definir atributos*/
  int id = 0;
  String nombre = '';
  double precio = 0.0;
  int stock = 0;
  Categoria categoria;
  /*Constructor */
  Producto({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.stock,
    required this.categoria,
  });

  @override
  String toString() {
    return 'Producto |id: $id | nombre: $nombre | precio: $precio | stock: $stock | categorias: $categoria|';
  }
}
