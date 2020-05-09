import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutterappposts/blocs/blog_bloc/blog_bloc.dart';
import 'package:flutterappposts/blocs/blog_bloc/blog_event.dart';
import 'package:flutterappposts/repository/blog_repository.dart';
import 'package:flutterappposts/ui/home_page.dart';

class Home extends StatelessWidget {
  final _blogRepository = BlogRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BlogBloc>(
      create: (context) {
        return BlogBloc(blogRepository: _blogRepository)..add(LoadBlog());
      },
      child: Scaffold(
        appBar: AppBar(title: Text('HOME')),
        body: HomePage(),
      ),
    );
  }
}
