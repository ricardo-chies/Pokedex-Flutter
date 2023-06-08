import 'dart:ui';

import 'package:flutter/material.dart';

class PokemonUtils {
  static String transformWeight(int weight) {
    double weightInKg = weight / 10;
    String weightString = weightInKg.toString();
    
    if (weightString.indexOf('.') != -1) {
      int decimalPlaces = weightString.split('.')[1].length;
      if (decimalPlaces < 1) {
        weightString += '0';
      }
    } else {
      weightString += '.0';
    }
    
    return '$weightString Kg';
  }

  static String transformHeight(int height) {
    double heightInMeters = height / 10;
    String heightString = heightInMeters.toStringAsFixed(2); // Limita para uma casa decimal
    
    return '$heightString m';
  }

  static Color getColorFromType(List<String> types) {
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
