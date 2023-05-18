import 'package:flutter/material.dart';
import 'package:pokedex/features/detalhes/container/detalheContainer.dart';

import '../../../common/models/pokemon.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.listPokemon, required this.onItemTap}) : super(key: key);
  final List<Pokemon> listPokemon;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: listPokemon.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(listPokemon[index].name),
            onTap: () => onItemTap('/details', DetailArguments(name: listPokemon[index].name),),
          );
        }
        ,)
    );
  }
}