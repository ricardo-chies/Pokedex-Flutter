import 'package:flutter/material.dart';
import 'package:pokedex/common/models/pokemon.dart';

class DetailListwidget extends StatelessWidget {
  const DetailListwidget({Key? key, required this.pokemon, required this.listPokemon, required this.controller, required this.onChangePokemon}) : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> listPokemon;
  final PageController controller;
    final ValueChanged<Pokemon> onChangePokemon;

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
                  onPageChanged: (index) {
                    onChangePokemon(listPokemon[index]);
                  },
                  controller: controller,
                  children: listPokemon.map(
                    (e) {  
                      bool diff = e.name != pokemon.name;
                      return AnimatedOpacity(
                        duration: Duration(milliseconds: 400),
                        opacity: diff ? 0.5 : 1.0,
                        child: Image.network(
                          e.image,
                          height: 100,
                          width: 100,
                          //fit: BoxFit.contain,
                          color: diff ? Colors.black.withOpacity(0.4) : null,
                          ),
                      );
                    }
                  ).toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}