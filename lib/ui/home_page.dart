import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterappposts/blocs/blog_bloc/blog_bloc.dart';
import 'package:flutterappposts/blocs/blog_bloc/blog_state.dart';
import 'package:flutterappposts/models/post.dart';
import 'package:flutterappposts/repository/blog_repository.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> postList = [];
  final _blogRepository = BlogRepository();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlogBloc, BlogState>(
      builder: (context, state) {
//        if (state is BlogLoading) {
//          return Center(child: CircularProgressIndicator());
//        }
//
//        if (state is BlogNoLoaded) {
//          return Center(
//            child: Column(
//              mainAxisSize: MainAxisSize.min,
//              children: [
//                Icon(Icons.error),
//                Text('Cannot load posts'),
//              ],
//            ),
//          );
//        }
//
//        if (state is BlogLoaded) {
//          postList = state.posts;
//          return Container(
//            child: postList.length == 0
//                ? Center(child: Text('No Blog Avaliable'))
//                : ListView.builder(
//                    itemCount: postList.length,
//                    itemBuilder: (context, index) {
//                      final post = postList[index];
//                      return postUI(post);
//                    },
//                  ),
//          );
//        }

        return StreamBuilder(
          stream: _blogRepository.getPosts(),
          builder: (context, AsyncSnapshot<List<Post>> snapshot) {
            if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

            int cantItems = snapshot.data.length;
            return cantItems == 0
                ? Center(child: Text('NO DATA', textScaleFactor: 3.0))
                : ListView.builder(
                    itemCount: cantItems,
                    itemBuilder: (context, index) {
                      final post = snapshot.data[index];
                      return postUI(post);
                    },
                  );
          },
        );
      },
    );
  }

  Widget postUI(Post post) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(14.0),
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  post.date,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
                Text(
                  post.time,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            FadeInImage.assetNetwork(
              fadeOutDuration: Duration(seconds: 2),
              height: 250.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: 'assets/loading.gif',
              image: post.imagen,
            ),
            SizedBox(height: 10.0),
            Text(
              post.descripcion,
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
