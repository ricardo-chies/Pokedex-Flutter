import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/features/detalhes/container/detalheContainer.dart';
import 'package:pokedex/features/pokedex/container/pokemonContainer.dart';
import 'package:pokedex/features/pokedex/telas/home.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({ Key? key, required this.repository, }) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
          return PokemonContainer(repository: repository, onItemTap: (route , arguments ) { 
            Navigator.of(context).pushNamed(route, arguments: arguments);
           },);
        });
        }
        
        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetalheContainer(
                repository: repository,
                arguments: (settings.arguments as DetailArguments), 
                onBack: () => Navigator.of(context).pop(),
              );
            },
          );
        }
      },
    );
  }
}