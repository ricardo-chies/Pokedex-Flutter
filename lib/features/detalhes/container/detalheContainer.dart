import 'package:flutter/material.dart';
import 'package:pokedex/common/failure/failure.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/features/detalhes/telas/detalhes.dart';
import 'package:pokedex/features/pokedex/telas/home.dart';
import '../../../common/models/pokemon.dart';
import '../../pokedex/telas/erro.dart';
import '../../pokedex/telas/load.dart';

class DetailArguments {
  final Pokemon pokemon;
  final int? index;

  DetailArguments({this.index = 0, required this.pokemon});
}

class DetalheContainer extends StatefulWidget {
  const DetalheContainer(
    {Key? key, required this.repository, required this.arguments, required this.onBack }) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  State<DetalheContainer> createState() => _DetalheContainerState();
}

class _DetalheContainerState extends State<DetalheContainer> {
  late PageController controller;
  @override
  void initState() {
    controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      
      future: widget.repository.getAllPokemons(),
      builder: (context, snapshot) {

      if(snapshot.connectionState == ConnectionState.waiting) {
        return Load();
      }

      if(snapshot.connectionState == ConnectionState.done && 
      snapshot.hasData) {
        return Detalhes(pokemon: widget.arguments.pokemon, listPokemon: snapshot.data!, onBack: widget.onBack, controller: controller,);
      }

      if(snapshot.hasError) {
        return Erro(error: (snapshot.error as Failure).message!,
        );
      }

      return Container();
    });
  }
}