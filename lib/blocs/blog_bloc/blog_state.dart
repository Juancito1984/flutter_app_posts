import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterappposts/models/post.dart';

abstract class BlogState extends Equatable {
  const BlogState();

  @override
  List<Object> get props => [];
}

//ESTADOS DEL BLOG
class BlogLoading extends BlogState {
  @override
  String toString() => 'Blog Loading';
}

class BlogLoaded extends BlogState {
  final List<Post> posts;

  const BlogLoaded({@required this.posts});

  @override
  List<Object> get props => [posts];

  @override
  String toString() => 'BlogLoaded';
}

class BlogNoLoaded extends BlogState {
  @override
  String toString() => 'Blog No Loaded';
}
