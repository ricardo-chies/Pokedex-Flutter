import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController searchController;
  final Function(String) onSearch;

  const SearchWidget({
    Key? key,
    required this.searchController,
    required this.onSearch,
  }) : super(key: key);

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  late FocusNode searchFocusNode;

  @override
  void initState() {
    super.initState();
    searchFocusNode = FocusNode();
  }

  @override
  void dispose() {
    searchFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: widget.searchController,
              focusNode: searchFocusNode,
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),
              decoration: InputDecoration(
                hintText: 'Digite o nome ou n° do Pokémon',
                hintStyle: TextStyle(
                  color: Colors.black.withOpacity(0.5), // Cor do texto do placeholder
                  fontSize: 16
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.red, // Cor da borda
                    width: 2
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                    color: Colors.blue.withOpacity(0.8), // Cor da borda quando está focada
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              if (searchFocusNode.hasFocus) {
                searchFocusNode.unfocus();
              }
              final searchText = widget.searchController.text;
              widget.onSearch(searchText);
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.white.withOpacity(0.9), // Cor do botão
            ),
            child: Text(
              'Buscar',
              style: TextStyle(
                color: Colors.blue.withOpacity(0.8), // Cor do texto do botão
              ),
            ),
          )
        ],
      ),
    );
  }
}
