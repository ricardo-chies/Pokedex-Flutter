import 'package:flutter/material.dart';

import '../../../common/models/pokemon.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.listPokemon}) : super(key: key);
  final List<Pokemon> listPokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}