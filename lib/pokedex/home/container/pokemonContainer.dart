import 'package:flutter/material.dart';
import 'package:pokedex/common/repositories/failure.dart';
import 'package:pokedex/common/repositories/pokemonRepository.dart';
import 'package:pokedex/pokedex/detalhes/container/detalheContainer.dart';
import 'package:pokedex/pokedex/home/telas/erro.dart';
import 'package:pokedex/pokedex/home/telas/load.dart';
import 'package:pokedex/pokedex/home/telas/home.dart';

import '../../../common/models/pokemon.dart';

class PokemonContainer extends StatefulWidget {
  const PokemonContainer({
    Key? key,
    required this.repository,
    required this.onItemTap,
  }) : super(key: key);

  final IPokemonRepository repository;
  final Function(String, DetailArguments) onItemTap;

  @override
  _PokemonContainerState createState() => _PokemonContainerState();
}

class _PokemonContainerState extends State<PokemonContainer> {
  List<Pokemon> _pokemons = [];

  @override
  void initState() {
    super.initState();
    _fetchPokemons();
  }

  // Chamada para todos os pokemons
  void _fetchPokemons() {
    widget.repository.getAllPokemons().then((pokemons) {
      setState(() {
        _pokemons = pokemons;
      });
    }).catchError((error) {
      print('Erro: $error');
    });
  }

  // Chamada um pokemon, passando o valor capturado na searchBox
  void _handleSearch(String searchText) {
    if (searchText.isNotEmpty) {
      widget.repository.getPokemonByNameOrNumber(searchText).then((pokemon) {
        setState(() {
          _pokemons = [pokemon];
        });
      }).catchError((error) {
        print('Erro: $error');
      });
    } else {
      _fetchPokemons();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pokemon>>(
      future: widget.repository.getAllPokemons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) { // Se a conexão está em andamento renderiza tela Load
          return Load();
        }

        if (snapshot.hasError) {
          return Erro(error: (snapshot.error as Failure).message!); // Se a conexão deu erro renderiza tela Erro
        }

        return Home(
          pokemons: _pokemons,
          onItemTap: widget.onItemTap, // Passa os valores para a tela Home
          onSearch: _handleSearch,
        );
      },
    );
  }
}
