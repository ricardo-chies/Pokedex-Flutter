import 'package:flutter/material.dart';
import 'package:pokedex/features/detalhes/container/detalheContainer.dart';
import 'package:pokedex/features/pokedex/telas/widgets/pokemonItemWidget.dart';

import '../../../common/models/pokemon.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.listPokemon, required this.onItemTap}) : super(key: key);
  final List<Pokemon> listPokemon;
  final Function(String, DetailArguments) onItemTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('Pokedéx', style: TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold,
                        fontSize: 26
                        ),),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu, 
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: listPokemon.map((e) => PokemonItemWidget(
            pokemon: e,
            onTap: onItemTap
            ,)
          )
          .toList(),       
        ),
      )
    );
  }
}