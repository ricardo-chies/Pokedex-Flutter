import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/failure.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/pokedex/detalhes/telas/detalhes.dart';
import 'package:pokedex/pokedex/home/telas/home.dart';
import '../../../common/models/pokemon.dart';
import '../../home/telas/erro.dart';
import '../../home/telas/load.dart';

class DetailArguments {
  DetailArguments({this.index = 0, required this.pokemon});
  final Pokemon pokemon;
  final int? index;
}

class DetalheContainer extends StatefulWidget {
  const DetalheContainer(
    {Key? key, required this.repository, required this.arguments, required this.onBack }) : super(key: key);
  final IPokemonRepository repository;
  final DetailArguments arguments;
  final VoidCallback onBack;

  @override
  _DetalheContainerState createState() => _DetalheContainerState();
}

class _DetalheContainerState extends State<DetalheContainer> {
  late PageController _controller;
  late Future<List<Pokemon>> _future;
  Pokemon? _pokemon;

  @override
  void initState() {
    _controller = PageController(
      viewportFraction: 0.5,
      initialPage: widget.arguments.index!
    );
    _future = widget.repository.getAllPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) { // Se a conexão está em andamento renderiza tela Load
          return Load();
        }

        if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
          if (_pokemon == null) {
            _pokemon = widget.arguments.pokemon;
          }

          return Detalhes(
            pokemon: _pokemon!,
            listPokemon: snapshot.data!,
            onBack: widget.onBack,
            controller: _controller,
            onChangePokemon: (Pokemon value) { // Passa os valores para a tela de detalhes
              setState(() {
                _pokemon = value;
              });
            },
          );
        }

        if (snapshot.hasError) {
          return Erro(error: (snapshot.error as Failure).message!); // Se a conexão teve falha renderiza tela de Erro
        }

        return Container();
      },
    );
  }
}
