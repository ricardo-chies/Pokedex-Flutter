import 'package:flutter/material.dart';
import 'package:pokedex/common/failure/failure.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/features/detalhes/telas/detalhes.dart';
import 'package:pokedex/features/pokedex/telas/home.dart';
import '../../../common/models/pokemon.dart';
import '../../pokedex/telas/erro.dart';
import '../../pokedex/telas/load.dart';

class DetailArguments {
  final String name;

  DetailArguments({required this.name});
}

class DetalheContainer extends StatelessWidget {
  const DetalheContainer(
    {Key? key, required this.repository, required this.arguments }) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;

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
        return Detalhes(name: arguments.name, list: snapshot.data!);
      }

      if(snapshot.hasError) {
        return Erro(error: (snapshot.error as Failure).message!,
        );
      }

      return Container();
    });
  }
}