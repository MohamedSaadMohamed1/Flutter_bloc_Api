import 'package:blocapi/presentation/pages/character_grid.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'business_logic/cubit/character_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backwardsCompatibility: false,
          backgroundColor: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            elevation: 20.0),
      ),
      home: BlocProvider(
        create: (context) => CharacterCubit()..fetchCharacters(),
        child: CharacterGrid(),
      ),
    );
  }
}
