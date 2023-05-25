import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailListwidget extends StatelessWidget {
  const DetailListwidget({Key? key, required this.pokemon, required this.listPokemon, required this.controller}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 80,
      left: 0,
      right: 0,
      height: 300,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(pokemon.name, style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Text('#${pokemon.num}', style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
                height: 150,
                width: double.infinity,
                child: PageView(
                  controller: controller,
                  children: listPokemon.map((e) => Image.network(
                    e.image,
                    height: 100,
                    width: 100,
                    //fit: BoxFit.contain,
                    ),
                  ).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}