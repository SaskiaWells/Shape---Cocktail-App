
import 'package:http/http.dart' as http;
import 'dart:convert';

class Drink {
  final String name;
  final String instructions;
  final String image;
  final String ingredients;
  final String measures;
  // final List<String>  ingredients;
  // final List<String>  measures;

  const Drink({
    required this.name,
    required this.instructions,
    required this.image,
    required this.ingredients,
    required this.measures,
  });



  factory Drink.fromJSON(Map<String, dynamic> json) {

// List<String> ingredients = [];
// List<String> measures = [];
// for (int i = 1; i <= 15; i++) {
//     String ingredient = json['strIngredient$i'];
//     String measure = json['strMeasure$i'];
//     if (ingredient != null && ingredient.isNotEmpty && measure != null && measure.isNotEmpty) {
//       ingredients.add(ingredient);
//       measures.add(measure);
//     }
//   }

    return Drink(
      name: json['strDrink'],
      instructions: json['strInstructions'],
      image: json['strDrinkThumb'],
      ingredients: json['strIngredient1'],
      measures: json['strMeasure1'],
      // ingredients: ingredients,
      // measures: measures,
    );
  }
}

class DrinkService {
  Future<List<Drink>> fetchCocktails() async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
    //   print(body['drinks'][0]);

    //  Object newbody = body['drinks'][0];

      final List<dynamic> drinkList = body['drinks'];

      final List<Drink> drinks = [];

      for (var i = 0; i < drinkList.length; i++) {
        final entry = drinkList[i];
        drinks.add(Drink.fromJSON(entry));
      }
      
      return drinks;      
    } else {
      throw Exception('Failed to load cocktail');
    }
  }
}


// class DrinkService {
//   Future<List<Drink>> fetchCocktails() async {
//     final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
//     if (response.statusCode == 200) {
//       final body = jsonDecode(response.body);

//       final List<Drink> drinks = [];

//       for(var i = 0; i < body['drinks'].length; i++) {
//         final entry = body['drinks'][0];
//         drinks.add(Drink.fromJSON(entry));
//       }
//       print(drinks);
//       return drinks;

//     } else {
//       throw Exception('Failed to load cocktail');
//     }
//   }
// }