import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/common/API/api.dart';
import 'package:pokedex/common/repositories/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class IPokemonRepository {
  Future<List<Pokemon>> getAllPokemons();
  Future<Pokemon> getPokemonByNameOrNumber(String nameOrNumber);
}

class PokemonRepository implements IPokemonRepository {
  final Dio dio;

  PokemonRepository({required this.dio});

  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(Api.pokeApi);
      final jsonData = response.data as Map<String, dynamic>;

      final List<dynamic> pokemonList = jsonData['results'] ?? [];

      List<Pokemon> pokemons = await Future.wait(pokemonList.map((item) async {
        final pokemonUrl = item['url'] as String;
        final pokemonResponse = await dio.get(pokemonUrl);
        final pokemonData = pokemonResponse.data as Map<String, dynamic>;
        final pokemon = Pokemon.fromMap(pokemonData);
        return pokemon;
      }));

      return pokemons;
    } catch (e) {
      print('Erro: $e');
      throw Failure(message: 'Não foi possível carregar os Pokémons');
    }
  }

  @override
  Future<Pokemon> getPokemonByNameOrNumber(String nameOrNumber) async {
    try {
      final response = await dio.get('${Api.pokeApiSearch}$nameOrNumber');
      final jsonData = response.data as Map<String, dynamic>;

      final pokemon = Pokemon.fromMap(jsonData, isSinglePokemon: true);
      return pokemon;

    } catch (e) {
      print('Erro: $e');
      throw Failure(message: 'Pokémon não encontrado');
    }
  }
}
