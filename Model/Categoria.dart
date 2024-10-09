class Categoria {
  int id;
  String? nombre = null;
  Categoria({required this.id, required this.nombre});

  @override
  String toString() {
    return '$id. $nombre';
  }
}
