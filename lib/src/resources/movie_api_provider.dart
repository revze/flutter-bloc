import 'dart:async';
import 'dart:convert';

import 'package:belajar_bloc/src/models/trailer_model.dart';
import 'package:http/http.dart' show Client;

import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '802b2c4b88ea1183e50e6b285a27696e';
  final _baseUrl = 'http://api.themoviedb.org/3/movie';

  Future<ItemModel> fetchMovieList() async {
    final response = await client.get('$_baseUrl/popular?api_key=$_apiKey');
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<TrailerModel> fetchTrailer(int movieId) async {
    final response =
        await client.get('$_baseUrl/$movieId/videos?api_key=$_apiKey');

    if (response.statusCode == 200) {
      return TrailerModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
