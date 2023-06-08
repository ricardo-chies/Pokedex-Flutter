import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/pokedex/detalhes/telas/widgets/detailAppBarWidget.dart';
import 'package:pokedex/pokedex/detalhes/telas/widgets/detailListInformationWidget.dart';
import 'package:pokedex/pokedex/detalhes/telas/widgets/detailListWidget.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key, required this.pokemon, required this.listPokemon, required this.onBack, required this.controller, required this.onChangePokemon}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  final VoidCallback onBack;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon, 
            onBack: onBack,
          ),
          DetailListWidget(
            pokemon: pokemon,
            listPokemon: listPokemon, 
            controller: controller, 
            onChangePokemon: onChangePokemon,
            ),
          DetailListInformationWidget(
            pokemon: pokemon,
            listPokemon: listPokemon, 
            controller: controller, 
            onChangePokemon: onChangePokemon
            )
        ],
      )
    );
  }
}