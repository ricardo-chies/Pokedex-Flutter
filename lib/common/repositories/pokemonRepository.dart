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

  // Busca todos os pokemons
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(Api.pokeApi);
      final jsonData = response.data as Map<String, dynamic>;

      final List<dynamic> pokemonList = jsonData['results'] ?? [];

      List<Pokemon> pokemons = await Future.wait(pokemonList.map((item) async { // Irá repetir este método para cada pokémon na lista.
        final pokemonUrl = item['url'] as String; // Pega a url daquele pokemon específico
        final pokemonResponse = await dio.get(pokemonUrl); // Faz uma nova requisição na API, para obter os dados do pokemon específico.
        final pokemonData = pokemonResponse.data as Map<String, dynamic>;
        final pokemon = Pokemon.fromMap(pokemonData); // Chama a classe pokemon para mapear os dados.
        return pokemon;
      }));

      return pokemons;
    } catch (e) {
      print('Erro: $e');
      throw Failure(message: 'Não foi possível carregar os Pokémons');
    }
  }

  // Busca um pokemon pelo Id ou nome
  @override
  Future<Pokemon> getPokemonByNameOrNumber(String nameOrNumber) async {
    try {
      final response = await dio.get('${Api.pokeApiSearch}$nameOrNumber');
      final jsonData = response.data as Map<String, dynamic>;

      final pokemon = Pokemon.fromMap(jsonData, isSinglePokemon: true); // Chama a classe pokemon para mapear os dados.
      return pokemon;

    } catch (e) {
      print('Erro: $e');
      throw Failure(message: 'Pokémon não encontrado');
    }
  }
}
