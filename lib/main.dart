import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/features/poke/route.dart';
import 'package:pokedex/features/pokedex/container/pokemonContainer.dart';
import 'package:pokedex/features/pokedex/telas/home.dart';
import 'features/pokedex/telas/load.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex Flutter',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: PokedexRoute(repository: PokemonRepository(dio: Dio(),),)
      
      //PokemonContainer(repository: PokemonRepository(dio: Dio()),

    );
  }
}
