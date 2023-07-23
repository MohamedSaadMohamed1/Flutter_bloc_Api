import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_service.dart';
import '../../models/model.dart';

class CharacterCubit extends Cubit<List<Character>> {
  final ApiService _apiService = ApiService();

  CharacterCubit() : super([]);

  Future<void> fetchCharacters() async {
    try {
      final characters = await _apiService.fetchCharacters();
      emit(characters);
    } catch (error) {
      // Handle error and emit an empty list or show an error state
      emit([]);
    }
  }
}
