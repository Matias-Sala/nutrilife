import 'package:equatable/equatable.dart';

class Categoria extends Equatable {
  final int id;
  final String nombre;

  const Categoria(this.id, this.nombre);

  @override
  List<Object> get props => [id, nombre];

  static Categoria fromJson(dynamic json) {
    return Categoria(json['id'], json['nombre']);
  }

  @override
  String toString() => 'Categoria { id: $id }';

}
