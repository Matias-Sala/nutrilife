part of 'categoria_bloc.dart';

abstract class CategoriaEvent extends Equatable {
  
  const CategoriaEvent();

  @override
  List<Object> get props => [];
}

class CategoriaLoadSuccess extends CategoriaEvent {}

class CategoriaSelected extends CategoriaEvent {
  final Categoria categoria;

  const CategoriaSelected(this.categoria);

  @override
  List<Object> get props => [categoria];

  @override
  String toString() => 'SelectCategoria { categoria: $categoria }';
}