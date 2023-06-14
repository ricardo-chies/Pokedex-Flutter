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
            child: GridView.count(
              crossAxisCount: 2, // Define o número de colunas
              childAspectRatio: 2.5, // Define a proporção altura/largura dos itens
              children: [
                _buildInfoRow('Hp:', pokemon.hp.toString()),
                _buildInfoRow('Speed:', pokemon.speed.toString()),
                _buildInfoRow('Attack:', pokemon.attack.toString()),
                _buildInfoRow('Defense:', pokemon.defense.toString()),
                _buildInfoRow('Special Attack:', pokemon.specialAttack.toString()),
                _buildInfoRow('Special Defense:', pokemon.specialDefense.toString()),
                _buildInfoRow('Altura:', pokemon.height),
                _buildInfoRow('Peso:', pokemon.weight),
              ],
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: 0.4,
              child: Image.asset(
                'images/pokeball.png',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) { // Método criado para melhor estrutura do código e evitar repetição
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(1),
          borderRadius: BorderRadius.circular(24),
            // border: Border.all(
            //   color: Colors.black,
            //   width: 2.0
          // )
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: pokemon.baseColor.withOpacity(1),
              ),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
