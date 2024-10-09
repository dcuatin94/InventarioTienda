import '../Model/Categoria.dart';
import '../Model/Producto.dart';
import '../View/CategoriaView.dart';
import '../View/InventarioView.dart';

class Inventariocontroller {
  // Iniciamos un
  List<Producto> productos = [];
  int producto_id = 0;
  Inventarioview vista;
  Inventariocontroller(this.vista);
  // Creamos una lista de categorias
  List<Categoria> categorias = [
    Categoria(id: 1, nombre: 'Electrónica'),
    Categoria(id: 2, nombre: 'Accesorios'),
    Categoria(id: 3, nombre: 'Ropa'),
    Categoria(id: 4, nombre: 'Hogar'),
  ];
  //Funcion para agregar Productos a la lista
  void agregarProducto() {
    bool continuar = true;
    Categoriaview categoriaview = Categoriaview();
    while (continuar) {
      producto_id = producto_id + 1;
      categoriaview.menu(categorias);
      Categoria categoria = categoriaview.seleccionarCategoria(categorias);
      String nombre = vista.solicitarDato('Nombre del producto: ');
      double precio =
          double.parse(vista.solicitarDato('Precio del producto: '));
      int stock = int.parse(vista.solicitarDato('Cantidad en stock: '));
      var producto = new Producto(
          id: producto_id,
          nombre: nombre,
          precio: precio,
          stock: stock,
          categoria: categoria);
      productos.add(producto);
      vista.mensaje('Producto agregado exitosamente: ${producto}');
      continuar = vista.preguntaContinuar('Desea agregar otro producto?');
    }
  }

  //Funcion para actualizar el stock
  void actualizarProducto() {
    bool continuar = true;
    if (productos.length > 0) {
      listarProductos();
      while (continuar) {
        int id_digitado = int.parse(vista
            .solicitarDato("Ingrese el id del producto para actualizar: "));
        var productoEncontrado =
            productos.singleWhere((producto) => producto.id == id_digitado);
        try {
          int nuevoStock =
              int.parse(vista.solicitarDato("Ingrese el nuevo Stock: "));
          productoEncontrado.stock = nuevoStock;
          vista.mensaje(
              "Producto actualizado correctamente: ${productoEncontrado}");
        } catch (e) {
          vista.mensaje("Producto no encontrado");
        }
        continuar = vista.preguntaContinuar('Desea actualizar otro producto?');
      }
    } else {
      vista.mensaje("No hay productos para actualizar");
    }
  }

  //Mostrar todos los productos ingresados
  void listarProductos() {
    vista.listarProductos(productos);
  }

  //Buscar productos por nombre que inicien con
  void buscarProducto() {
    bool continuar = true;
    while (continuar) {
      var buscar = vista.solicitarDato('\nNombre del producto a buscar: ');
      try {
        var productoEncontrado = productos
            .where(
                (p) => p.nombre.toLowerCase().startsWith(buscar.toLowerCase()))
            .toList();
        vista.mensaje('Producto encontrado: \n${productoEncontrado}');
      } catch (e) {
        vista.mensaje('Producto no encontrado');
      }
      continuar = vista.preguntaContinuar('Desea buscar otro producto?');
    }
  }

  //Medoto que calcula el valor total del inventario
  void totalInventario() {
    double total = productos.fold(
        0, (total, producto) => total + (producto.precio * producto.stock));
    vista.mensaje('\nValor total del inventario: [\$${total}]');
  }

  //Metodo que gestiona el menu
  void iniciar() {
    bool continuar = true;
    while (continuar) {
      vista.menuInventario();
      String? seleccion = vista.solicitarDato('Ingresa una opcion: ');
      switch (seleccion) {
        case '1':
          agregarProducto();
          listarProductos();
          break;

        case '2':
          buscarProducto();
          break;

        case '3':
          actualizarProducto();
          listarProductos();
          break;

        case '4':
          listarProductos();
          totalInventario();
          vista.preguntaContinuar("\nPara regresar digite");
        case '5':
          listarProductos();
          vista.preguntaContinuar("\nPara regresar digite");
          break;

        case '6':
          continuar = false;
          vista.mensaje('Saliendo del programa....');
          break;

        default:
          vista.mensaje('Opcion no valida');
          break;
      }
    }
  }
}
