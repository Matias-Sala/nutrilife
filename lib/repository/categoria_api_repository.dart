import 'package:nutrilife/repository/categoria_repository.dart';
import 'package:nutrilife/repository/models/categoria.dart';
import 'package:nutrilife/repository/models/post.dart';

class CategoriaApiRepository extends CategoriaRepository{
  @override
  Future<void> addNewCategoria(Categoria categoria) {
    // TODO: implement addNewCategoria
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCategoria(int categoriaId) {
    // TODO: implement deleteCategoria
    throw UnimplementedError();
  }

  @override
  Future<Categoria> getCategoria(int categoriaId) {
    // TODO: implement getCategoria
    throw UnimplementedError();
  }

  @override
  Future<List<Categoria>> getCategorias() {
    const categorias = [Categoria(1, 'Categoria 1'), Categoria(1, 'Categoria 2')];

    return Future.delayed(Duration(milliseconds: 3000)).then((value) => categorias);
  }

  @override
  Future<void> updateCategoria(Categoria categoria) {
    // TODO: implement updateCategoria
    throw UnimplementedError();
  }

}