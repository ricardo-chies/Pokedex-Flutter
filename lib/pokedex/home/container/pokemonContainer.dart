import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/failure.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/telas/home.dart';

import '../../../common/models/pokemon.dart';
import '../telas/erro.dart';
import '../telas/load.dart';

class PokemonContainer extends StatelessWidget {
  const PokemonContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Load();
        }

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          return Home(listPokemon: snapshot.data!, onItemTap: onItemTap);
        }

        if (snapshot.hasError) {
          return Erro(error: (snapshot.error as Failure).message!);
        }

        return Container();
      },
    );
  }
}
