import 'Controller/InventarioController.dart';
import 'View/InventarioView.dart';

// Metodo que da inicio al programa
void main() {
  var view = new Inventarioview();
  var controlador = new Inventariocontroller(view);
  controlador.iniciar();
}
