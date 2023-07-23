import 'package:blocapi/business_logic/cubit/character_cubit.dart';
import 'package:blocapi/models/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'character_details_screen.dart';

class CharacterGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharacterCubit, List<Character>>(
      builder: (context, characters) {
        if (characters.isEmpty) {
          // Show loading indicator or error message
          return Center(child: CircularProgressIndicator());
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('characters'),
            ),
            body: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final character = characters[index];
                return CharacterCard(character: character);
              },
            ),
          );
        }
      },
    );
  }
}

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        // Navigate to character details screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharacterDetailsScreen(character: character),
          ),
        );
      },
      child: Column(
        children: [
          Flexible(
            child: Image.network(
              character.image,
              fit: BoxFit.cover,
            ),
          ),
          Text(character.name),
          // Add more details if needed
        ],
      ),
    ));
  }
}
