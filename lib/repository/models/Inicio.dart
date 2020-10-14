import 'package:equatable/equatable.dart';

import 'models.dart';

class Inicio extends Equatable {
  final int id;
  final List<Categoria> categorias;

  const Inicio(this.id, this.categorias);

  @override
  List<Object> get props => [id, categorias];

  static Inicio fromJson(dynamic json) {
    return Inicio(json['_id'], List<Categoria>.from(json['categorias']));
  }

  @override
  String toString() => 'Inicio { id: $id }';
}
