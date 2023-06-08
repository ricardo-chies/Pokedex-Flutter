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
      top: 370,
      left: 0,
      right: 0,
      height: 400,
      child: Stack(
        children: [
          Container(
            color: pokemon.baseColor,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: ListView(
              children: [
                _buildInfoRow('Altura:', pokemon.height),
                _buildInfoRow('Peso:', pokemon.weight),
                Visibility(
                  visible: pokemon.egg != "Not in Eggs",
                  child: _buildInfoRow('Ovo:', pokemon.egg),
                ),
                _buildInfoRow('Fraquezas:', pokemon.weaknesses.join(", ")),
                Visibility(
                  visible: getPrevEvolutionName(pokemon) != "",
                  child: _buildInfoRow('Evolução Anterior:', getPrevEvolutionName(pokemon)),
                ),
                Visibility(
                  visible: getNextEvolutionName(pokemon) != "",
                  child: _buildInfoRow('Próxima Evolução:', getNextEvolutionName(pokemon)),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.2,
              child: Image.asset(
                'images/pokeball.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 1),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 1),
      ],
    );
  }

  String getNextEvolutionName(Pokemon pokemon) {
    if (pokemon.nextEvolution.isNotEmpty) {
      return pokemon.nextEvolution[0].name;
    } else {
      return "";
    }
  }

  String getPrevEvolutionName(Pokemon pokemon) {
    if (pokemon.prevEvolution.isNotEmpty) {
      final lastIndex = pokemon.prevEvolution.length - 1;
      return pokemon.prevEvolution[lastIndex].name;
    } else {
      return "";
    }
  }
}
