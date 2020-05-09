import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  String imagen;
  String descripcion;
  String date;
  String time;
  String id;

  Post(this.imagen, this.descripcion, this.date, this.time, this.id);

  static Post fromSnapshot(DocumentSnapshot snapshot) {
    return Post(
      snapshot.data['imagen'],
      snapshot.data['descripcion'],
      snapshot.data['date'],
      snapshot.data['time'],
      snapshot.documentID,
    );
  }

}
