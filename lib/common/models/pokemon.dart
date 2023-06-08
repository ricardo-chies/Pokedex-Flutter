import 'dart:ui';
import 'package:flutter/material.dart';

import '../utils/pokemonUtils.dart';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String image;
  final List<String> types;
  final Color baseColor;
  final String height;
  final String weight;
  final String egg;
  final List<String> weaknesses;
  final List<PokemonEvolution> prevEvolution;
  final List<PokemonEvolution> nextEvolution;

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.image,
    required this.types,
    required this.baseColor,
    required this.height,
    required this.weight,
    required this.egg,
    required this.weaknesses,
    required this.prevEvolution,
    required this.nextEvolution,
  });

factory Pokemon.fromMap(Map<String, dynamic> json) {
  final List<String> types = (json['types'] as List<dynamic>)
      .map((type) => type['type']['name'] as String)
      .toList();
  final Color baseColor = _getBaseColor(types);

  final List<String> weaknesses = (json['types'] as List<dynamic>)
      .map((type) => type['type']['name'] as String)
      .toList();

  final List<PokemonEvolution> prevEvolution = (json['prevEvolution'] as List<dynamic>?)
      ?.map((evolution) => PokemonEvolution(
            num: evolution['num'] ?? '',
            name: evolution['name'] ?? '',
          ))
      .toList() ?? [];

  final List<PokemonEvolution> nextEvolution = (json['nextEvolution'] as List<dynamic>?)
      ?.map((evolution) => PokemonEvolution(
            num: evolution['num'] ?? '',
            name: evolution['name'] ?? '',
          ))
      .toList() ?? [];

    final int heightValue = json['height'];
    final String formattedHeight = PokemonUtils.transformHeight(heightValue);

    final int weightValue = json['weight'];
    final String formattedWeight = PokemonUtils.transformWeight(weightValue);

  return Pokemon(
    id: json['id'],
    num: json['id'].toString(),
    name: json['name'],
    image: json['sprites']['front_default'],
    types: types,
    baseColor: baseColor,
    height: formattedHeight,
    weight: formattedWeight,
    egg: '',
    weaknesses: weaknesses,
    prevEvolution: prevEvolution,
    nextEvolution: nextEvolution,
  );
}

  static Color _getBaseColor(List<String> types) {
    switch (types[0]) {
      case 'Normal':
        return Colors.brown[400]!;
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400]!;
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300]!;
      case 'Flying':
        return Colors.indigo[200]!;
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500]!;
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400]!;
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800]!;
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100]!;
      default:
        return Colors.grey;
    }
  }
}

class PokemonEvolution {
  final String num;
  final String name;

  PokemonEvolution({required this.num, required this.name});
}
