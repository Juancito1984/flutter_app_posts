import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterappposts/blocs/blog_bloc/blog_event.dart';
import 'package:flutterappposts/blocs/blog_bloc/blog_state.dart';
import 'package:flutterappposts/models/post.dart';
import 'package:flutterappposts/repository/blog_repository.dart';

class BlogBloc extends Bloc<BlogEvent, BlogState> {
  final BlogRepository blogRepository;

  BlogBloc({@required this.blogRepository}) : assert(blogRepository != null);

  @override
  BlogState get initialState => BlogLoading();

  @override
  Stream<BlogState> mapEventToState(BlogEvent event) async* {
    if (event is LoadBlog) {
      yield* _mapLoadBlogToState();
    }
  }

  Stream<BlogState> _mapLoadBlogToState() async* {
    yield BlogLoading();

    try {
      final List<Post> posts = await blogRepository.getPosts().first;
      yield BlogLoaded(posts: posts);
    } catch (error) {
      yield BlogNoLoaded();
    }
  }
}
