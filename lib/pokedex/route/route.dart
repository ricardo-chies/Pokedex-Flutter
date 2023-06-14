import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/container/pokemonContainer.dart';
import 'package:pokedex/pokedex/home/telas/home.dart';

class PokedexRoute extends StatelessWidget {
  const PokedexRoute({ Key? key, required this.repository, }) : super(key: key);
  final PokemonRepository repository;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: '/', // Rota inicial
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) {
          return PokemonContainer(repository: repository, onItemTap: (route , arguments ) { // Passo os valores necessários para esta tela
            Navigator.of(context).pushNamed(route, arguments: arguments); 
           },);
        });
        }
        
        if (settings.name == '/details') {
          return MaterialPageRoute(
            builder: (context) {
              return DetalheContainer( // Passo os valores necessários para esta tela
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