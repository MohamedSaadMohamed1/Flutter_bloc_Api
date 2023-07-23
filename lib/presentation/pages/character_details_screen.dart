import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailsScreen({required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              character.image,
              height: 200,
            ),
            SizedBox(height: 16),
            Text('Name: ${character.name}'),
            Text('Status: ${character.status}'),
            Text('Created: ${character.created}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
