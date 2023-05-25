import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedex/common/API/api.dart';
import 'package:pokedex/common/repositories/failure.dart';
import 'package:pokedex/common/models/pokemon.dart';

abstract class IPokemonRepository {
    Future<List<Pokemon>> getAllPokemons();
}

class PokemonRepository implements IPokemonRepository{
  final Dio dio;

  PokemonRepository({required this.dio});
  @override
  Future<List<Pokemon>> getAllPokemons() async {
    try {
      final response = await dio.get(Api.allPokemonsURL);
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();

    } catch (e) {
      throw Failure(message: 'Não foi possível carregar os Pokémons');
    }
  }
}