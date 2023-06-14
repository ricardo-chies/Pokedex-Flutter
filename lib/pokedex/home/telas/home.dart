import 'package:flutter/material.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/telas/widgets/pokemonItemWidget.dart';
import 'package:pokedex/pokedex/home/telas/widgets/searchWidget.dart';
import '../../../common/models/pokemon.dart';

class Home extends StatelessWidget {
  const Home({Key? key, required this.pokemons, required this.onItemTap, required this.onSearch}) : super(key: key);

  final List<Pokemon> pokemons;
  final Function(String, DetailArguments) onItemTap;
  final Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    final isSinglePokemon = pokemons.length == 1;
    final crossAxisCount = isSinglePokemon ? 2 : 3;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,),
          child: Image.asset(
            'images/pokedex.png',
            width: 200,
          ),
        ),
      ),
      body: Column(
        children: [
          SearchWidget(
            searchController: TextEditingController(),
            onSearch: onSearch,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index];
                  return PokemonItemWidget(
                    pokemon: pokemon,
                    onTap: (name, args) => onItemTap(name, args),
                    index: index,
                    isSinglePokemon: isSinglePokemon,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
