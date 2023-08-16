import 'package:flutter/material.dart';
import '../widgets/post_item.dart';
import '../states/post_states.dart';


class PostList extends StatelessWidget {
  final PostState? state;

  const PostList({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    if (state == null) {
      return Center(child: Text('No hay usuario seleccionado.'));
    } else {
      switch (state.runtimeType) {
        case LoadedPostsSuccess:
          {
            return _userList(context, state as LoadedPostsSuccess);
          }
        case LoadedPostsFail:
          {
            return _fail(context, state as LoadedPostsFail);
          }
        case LoadingPosts:
        default:
          {
            return _loading();
          }
      }
    }
  }

  Widget _loading() => const Center(child: CircularProgressIndicator());

  Widget _userList(BuildContext context, LoadedPostsSuccess state) {
    return ListView.builder(
      itemCount: state.posts.length,
      itemBuilder: (BuildContext context, int index) {
        return PostItem(post: state.posts[index]);
      },
    );
  }

  Widget _fail(BuildContext context, LoadedPostsFail fail) {
    return Center(child: Text('Error: ${fail.error}'));
  }
}
