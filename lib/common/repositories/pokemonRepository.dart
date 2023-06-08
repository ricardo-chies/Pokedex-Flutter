import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex/common/API/api.dart';
import 'package:pokedex/common/repositories/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(Api.pokeApi);
      final jsonData = response.data as Map<String, dynamic>;
      final List<Pokemon> pokemons = [];

      final List<dynamic> pokemonList = jsonData['results'] ?? [];

      for (var item in pokemonList) {
        final pokemonUrl = item['url'] as String;
        final pokemonResponse = await dio.get(pokemonUrl);
        final pokemonData = pokemonResponse.data as Map<String, dynamic>;
        final pokemon = Pokemon.fromMap(pokemonData);
        pokemons.add(pokemon);
      }

      return pokemons;
    } catch (e) {
      print('Erro: $e');
      throw Failure(message: 'Não foi possível carregar os Pokémons');
    }
  }
}


