import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutterappposts/models/post.dart';

class BlogRepository {
  final reference = Firestore.instance;

  Stream<List<Post>> getPosts() {
    return reference.collection('POSTS').snapshots().map((snapshot) {
      return snapshot.documents.map((document) {
        return Post.fromSnapshot(document);
      }).toList();
    });
  }

}
