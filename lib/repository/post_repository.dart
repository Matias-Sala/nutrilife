import 'dart:async';

import 'models/models.dart';


abstract class PostRepository {
  Future<void> addNewPost(Post post);

  Future<void> deletePost(int postId);

  Future<Post> getPost(int postId);

  Future<List<Post>> getPosts(int categoriaId);

  Future<void> updatePost(Post post);
}