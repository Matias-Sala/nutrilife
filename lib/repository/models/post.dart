import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Post extends Equatable {
  final int id;
  final String titulo;
  final String subTitulo;
  final String imagen;
  final MaterialColor materialColor;
  final int categoriaId;

  const Post(this.id, this.categoriaId, this.titulo, this.subTitulo,
      this.materialColor, this.imagen);

  @override
  List<Object> get props =>
      [id, titulo, categoriaId, subTitulo, materialColor, imagen];

  static Post fromJson(dynamic json) {
    return Post(json['id'], json['categoriaId'], json['titulo'],
        json['subTitulo'], json['materialColor'], json['imagen']);
  }

  @override
  String toString() => 'Post { id: $id }';
}
