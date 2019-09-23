import 'dart:convert';

import 'package:belajar_bloc/src/blocs/bloc.dart';
import 'package:belajar_bloc/src/models/post.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final http.Client httpClient;

  PostBloc({@required this.httpClient});

  @override
  // TODO: implement initialState
  PostState get initialState => PostUninitialized();

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    // TODO: implement mapEventToState
    if (event is Fetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostUninitialized) {
          final posts = await _fetchPosts(0, 20);
          yield PostLoaded(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostLoaded) {
          final posts =
              await _fetchPosts((currentState as PostLoaded).posts.length, 20);
          yield posts.isEmpty
              ? (currentState as PostLoaded).copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: (currentState as PostLoaded).posts + posts,
                  hasReachedMax: false);
        }
      } catch (_) {
        yield PostError();
      }
    }
  }

  bool _hasReachedMax(PostState state) =>
      state is PostLoaded && state.hasReachedMax;

  Future<List<Post>> _fetchPosts(int startIndex, int limit) async {
    final response = await httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return Post(
          id: rawPost['id'],
          title: rawPost['title'],
          body: rawPost['body'],
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }

  @override
  Stream<PostState> transformEvents(Stream<PostEvent> events,
      Stream<PostState> Function(PostEvent event) next) {
    // TODO: implement transformEvents
    return super.transformEvents(
        (events as Observable<PostEvent>)
            .debounceTime(Duration(milliseconds: 500)),
        next);
  }
}
