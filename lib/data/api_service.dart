import 'package:dio/dio.dart';

import '../models/model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<Character>> fetchCharacters() async {
    try {
      final response =
          await _dio.get('https://rickandmortyapi.com/api/character');
      final data = response.data['results'] as List<dynamic>;
      final characters = data.map((json) => Character.fromJson(json)).toList();
      return characters;
    } catch (error) {
      throw Exception('Failed to fetch characters: $error');
    }
  }
}
