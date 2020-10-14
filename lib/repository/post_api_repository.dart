import 'package:flutter/material.dart';
import 'package:nutrilife/repository/models/post.dart';
import 'package:nutrilife/repository/post_repository.dart';

class PostApiRepository extends PostRepository {
  @override
  Future<void> addNewPost(Post post) {
    // TODO: implement addNewPost
    throw UnimplementedError();
  }

  @override
  Future<void> deletePost(int postId) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<Post> getPost(int postId) {
    // TODO: implement getPost
    throw UnimplementedError();
  }

  @override
  Future<List<Post>> getPosts(int categoriaId) {
    const posts = [
      Post(
          1,
          1,
          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's 
          standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it.''',
          '',
          Colors.lightGreen,
          'https://mejorconsalud.com/wp-content/uploads/2020/05/mujer-bostezando-oficina.jpg'),
      Post(2, 1, 'Post 2', '', Colors.lightBlue,
          'https://mejorconsalud.com/wp-content/uploads/2020/05/alimentos-ultraprocesados.jpg'),
      Post(3, 1, 'Post 3', '', Colors.amber,
          'https://mejorconsalud.com/wp-content/uploads/2020/05/tipos-quinoa.jpg'),
      Post(4, 1, 'Post 4', '', Colors.lime,
          'https://mejorconsalud.com/wp-content/uploads/2020/05/corazon-azucar.jpg')
    ];

    return Future.delayed(Duration(milliseconds: 3000)).then((value) =>
        posts.where((post) => post.categoriaId == categoriaId).toList());
  }

  @override
  Future<void> updatePost(Post post) {
    // TODO: implement updatePost
    throw UnimplementedError();
  }
}
