import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailListInformationWidget extends StatelessWidget {
  const DetailListInformationWidget({
    Key? key,
    required this.pokemon,
    required this.listPokemon,
    required this.controller,
    required this.onChangePokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 380,
      left: 0,
      right: 0,
      height: 400,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Altura: ${pokemon.height}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Peso: ${pokemon.weight}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Visibility(
                    visible: pokemon.egg != "Not in Eggs",
                    child: Text(
                      'Ovo: ${pokemon.egg}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text(
                    'Fraquezas: ${pokemon.weaknesses.join(", ")}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Visibility(
                    visible: getPrevEvolutionNames(pokemon) != "",
                    child: Text(
                      'Evolução Anterior: ${getPrevEvolutionNames(pokemon)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: getNextEvolutionNames(pokemon) != "",
                    child: Text(
                      'Próxima Evolução: ${getNextEvolutionNames(pokemon)}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getNextEvolutionNames(Pokemon pokemon) {
    final evolutionNames = pokemon.nextEvolution.map((evolution) => evolution.name).toList();
    return evolutionNames.join(", ");
  }

  String getPrevEvolutionNames(Pokemon pokemon) {
    final evolutionNames = pokemon.prevEvolution.map((evolution) => evolution.name).toList();
    return evolutionNames.join(", ");
  }
}