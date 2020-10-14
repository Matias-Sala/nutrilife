part of 'categoria_bloc.dart';

abstract class CategoriaState extends Equatable {
  const CategoriaState();
  
  @override
  List<Object> get props => [];
}

class SelectedState  extends CategoriaState {
  final Categoria categoria;

  const SelectedState([this.categoria]);

  @override
  List<Object> get props => [categoria];

  @override
  String toString() => 'SelectedState { categoria: $categoria }';
}

class LoadInProgressState extends CategoriaState {}

class LoadSuccessState  extends CategoriaState {
  final List<Categoria> categorias;

  const LoadSuccessState([this.categorias = const []]);

  @override
  List<Object> get props => [categorias];

  @override
  String toString() => 'CategoriaLoadSuccess { categorias: $categorias }';
}

class LoadFailureState extends CategoriaState {}