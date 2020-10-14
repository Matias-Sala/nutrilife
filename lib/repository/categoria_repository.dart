import 'dart:async';

import 'models/models.dart';

abstract class CategoriaRepository {
  Future<void> addNewCategoria(Categoria categoria);

  Future<void> deleteCategoria(int categoriaId);

  Future<Categoria> getCategoria(int categoriaId);

  Future<List<Categoria>> getCategorias();

  Future<void> updateCategoria(Categoria categoria);
}