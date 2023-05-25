import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/features/detalhes/telas/widgets/detailAppBarWidget.dart';
import 'package:pokedex/features/detalhes/telas/widgets/detailListWidget.dart';

class Detalhes extends StatelessWidget {
  const Detalhes({Key? key, required this.pokemon, required this.listPokemon, required this.onBack, required this.controller}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  final VoidCallback onBack;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DetailAppBarWidget(
            pokemon: pokemon, 
            onBack: onBack,
          ),
          DetailListwidget(
            pokemon: pokemon,
            listPokemon: listPokemon, 
            controller: controller,
            )
        ],
      )
    );
  }
}