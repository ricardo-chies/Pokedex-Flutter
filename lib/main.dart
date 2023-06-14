import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/pokedex/route/route.dart';
import 'package:pokedex/pokedex/home/container/pokemonContainer.dart';
import 'package:pokedex/pokedex/home/telas/home.dart';
import 'pokedex/home/telas/load.dart';

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
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: PokedexRoute(repository: PokemonRepository(dio: Dio(),),)
      
      //PokemonContainer(repository: PokemonRepository(dio: Dio()),

    );
  }
}
