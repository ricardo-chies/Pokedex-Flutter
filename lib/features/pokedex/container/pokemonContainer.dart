import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/features/pokedex/telas/home.dart';

import '../../../common/models/pokemon.dart';
import '../telas/erro.dart';
import '../telas/load.dart';

class PokemonContainer extends StatelessWidget {
  const PokemonContainer({Key? key, required this.repository }) : super(key: key);
  final IPokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {

      if(snapshot.connectionState == ConnectionState.waiting) {
        return Load();
      }

      if(snapshot.connectionState == ConnectionState.done && 
      snapshot.hasData) {
        return Home(listPokemon: snapshot.data!);
      }

      if(snapshot.hasError) {
        return Erro(error: snapshot.error.toString(),);
      }

      return Container();
    });
  }
}