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
  final int hp;
  final int attack;
  final int defense;
  final int specialAttack;
  final int specialDefense;
  final int speed;
  final bool isSinglePokemon; // Novo atributo

  Pokemon({
    required this.id,
    required this.num,
    required this.name,
    required this.image,
    required this.types,
    required this.baseColor,
    required this.height,
    required this.weight,
    required this.hp,
    required this.attack,
    required this.defense,
    required this.specialAttack,
    required this.specialDefense,
    required this.speed,
    required this.isSinglePokemon, // Novo atributo
  });

  factory Pokemon.fromMap(Map<String, dynamic> json, {bool isSinglePokemon = false}) {
    try {
      final List<String> types = (json['types'] as List<dynamic>)
          .map((type) => type['type']['name'] as String)
          .toList();

      final Color baseColor = PokemonUtils.getColorFromType(types);

      final int heightValue = json['height'];
      final String formattedHeight = PokemonUtils.transformHeight(heightValue);

      final int weightValue = json['weight'];
      final String formattedWeight = PokemonUtils.transformWeight(weightValue);

      return Pokemon(
        id: json['id'],
        num: json['id'].toString(),
        name: json['name'],
        //image: json['sprites']['front_default'],
        image: json['sprites']['other']['dream_world']['front_default'],
        types: types,
        baseColor: baseColor,
        height: formattedHeight,
        weight: formattedWeight,
        hp: json['stats'][0]['base_stat'],
        attack: json['stats'][1]['base_stat'],
        defense: json['stats'][2]['base_stat'],
        specialAttack: json['stats'][3]['base_stat'],
        specialDefense: json['stats'][4]['base_stat'],
        speed: json['stats'][5]['base_stat'],
        isSinglePokemon: isSinglePokemon, // Definir o valor do novo atributo
      );
    } catch (e) {
      throw FormatException('Erro ao mapear dados do Pokemon: $e');
    }
  }
}
