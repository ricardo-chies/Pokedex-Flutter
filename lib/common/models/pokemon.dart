import 'dart:ui';

import 'package:flutter/material.dart';

class Pokemon {
  final int id;
  final String num;
  final String name;
  final String image;
  final List<String> type;
  final String height;
  final String weight;
  final String egg;
  final List<String> weaknesses;
  //final List<String> prevEvolution;
  //final List<String> nextEvolution;

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      id: json['id'], 
      num: json['num'],
      name: json['name'], 
      image: json['img'], 
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      height: json['height'],
      weight: json['weight'],
      egg: json['egg'],
      weaknesses: (json['weaknesses'] as List<dynamic>).map((e) => e as String).toList(),
      //weaknesses: json['weaknesses'].cast<String>(),
      //prevEvolution: json['prev_evolution.name'],
      //prevEvolution: (json['prev_evolution.name'] as List<dynamic>).map((e) => e as String).toList(),
      //nextEvolution: (json['next_evolution'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Color? get baseColor => _color(type: type[0]);

  Pokemon({
    required this.id, 
    required this.num, 
    required this.name, 
    required this.image,
    required this.type,
    required this.height,
    required this.weight,
    required this.egg,
    required this.weaknesses,
    //required this.prevEvolution,
    //required this.nextEvolution
    });

      static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
      }
    }
}