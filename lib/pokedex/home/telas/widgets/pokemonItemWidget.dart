import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/telas/widgets/typeWidget.dart';

class PokemonItemWidget extends StatelessWidget {
  const PokemonItemWidget({
    Key? key,
    required this.pokemon,
    required this.onTap,
    required this.index,
  }) : super(key: key);

  final Pokemon pokemon;
  final Function(String, DetailArguments) onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    final baseColor = _getColorFromType(pokemon.types);

    return GestureDetector(
      onTap: () => onTap('/details', DetailArguments(pokemon: pokemon, index: index)),
      child: Container(
        decoration: BoxDecoration(
          color: baseColor,
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
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
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
                    child: Image.network(pokemon.image),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorFromType(List<String> types) {
    if (types.isEmpty) {
      return Colors.grey;
    }

    final type = types.first.toLowerCase();
    switch (type) {
      case 'normal':
        return Colors.brown[400]!;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'grass':
        return Colors.green;
      case 'electric':
        return Colors.amber;
      case 'ice':
        return Colors.cyanAccent[400]!;
      case 'fighting':
        return Colors.orange;
      case 'poison':
        return Colors.purple;
      case 'ground':
        return Colors.orange[300]!;
      case 'flying':
        return Colors.indigo[200]!;
      case 'psychic':
        return Colors.pink;
      case 'bug':
        return Colors.lightGreen[500]!;
      case 'rock':
        return Colors.grey;
      case 'ghost':
        return Colors.indigo[400]!;
      case 'dark':
        return Colors.brown;
      case 'dragon':
        return Colors.indigo[800]!;
      case 'steel':
        return Colors.blueGrey;
      case 'fairy':
        return Colors.pinkAccent[100]!;
      default:
        return Colors.grey;
    }
  }
}
