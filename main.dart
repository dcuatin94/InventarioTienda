import 'Controller/InventarioController.dart';
import 'View/InventarioView.dart';

// Función que da inicio al programa
void main() {
  var view = new Inventarioview();
  var controlador = new Inventariocontroller(view);
  controlador.iniciar();
}
