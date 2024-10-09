import 'Controller/InventarioController.dart';
import 'View/InventarioView.dart';

void main() {
  var view = new Inventarioview();
  var controlador = new Inventariocontroller(view);
  controlador.iniciar();
}
