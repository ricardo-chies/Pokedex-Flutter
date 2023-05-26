import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/telas/widgets/pokemonItemWidget.dart';

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
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          children: listPokemon.map((e) => PokemonItemWidget(
            pokemon: e,
            onTap: onItemTap,
            index: listPokemon.indexOf(e)
            ,)
          )
          .toList(),       
        ),
      )
    );
  }
}