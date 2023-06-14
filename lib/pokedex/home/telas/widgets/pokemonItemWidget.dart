import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/telas/widgets/typeWidget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
    required this.index,
    required this.isSinglePokemon,
  }) : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;
  final bool isSinglePokemon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon, index: index)), // Ao clicar no card muda para a tela Details
      child: Container(
        decoration: BoxDecoration(
          color: pokemon.baseColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: isSinglePokemon ? 25 : 16,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: isSinglePokemon ? 20 : 13,
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: pokemon.types.map((type) => TypeWidget(typeName: type)).toList(),
                  ),
                  Flexible(
                    child: SvgPicture.network(
                      pokemon.image,
                      width: isSinglePokemon ? 110 : 75,
                      height: isSinglePokemon ? 102 : 75,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
