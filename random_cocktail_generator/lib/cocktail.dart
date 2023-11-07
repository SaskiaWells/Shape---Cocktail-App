import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Cocktail extends StatefulWidget {
  const Cocktail({Key? key}) : super(key: key);

  @override
  _CocktailState createState() => _CocktailState();
}

class _CocktailState extends State<Cocktail> {
  List<String> cocktails = [];

  @override
  void initState() {
    super.initState();
    fetchCocktails();
  }

  Future<void> fetchCocktails() async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      setState(() {
        cocktails = List<String>.from(body['drinks'].map((drink) => drink['strDrink']));
      });
    } else {
      throw Exception('Failed to load cocktail');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Cocktail Generator'),
      ),
      body: ListView.builder(
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cocktails[index]),
          );
        },
      ),
    );
  }
}
