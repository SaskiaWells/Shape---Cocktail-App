import 'package:http/http.dart' as http;
import 'dart:convert';

class Drink {

  //this is the class that is used to store the data from the API call
  final String name;
  final String instructions;
  final String image;
  final String ingredient1;
  final String measure1;
  final String ingredient2;
  final String measure2;
  final String ingredient3;
  final String measure3;
  final String ingredient4;
  final String measure4;
  final String ingredient5;
  final String measure5;
  final String ingredient6;
  final String measure6;
  final String ingredient7;
  final String measure7;
  

//this is the constructor for the Drink class
  const Drink({
    required this.name,
    required this.instructions,
    required this.image,
    required this.ingredient1,
    required this.measure1,
    required this.ingredient2,
    required this.measure2,
    required this.ingredient3,
    required this.measure3,
    required this.ingredient4,
    required this.measure4,
    required this.ingredient5,
    required this.measure5,
    required this.ingredient6,
    required this.measure6,
    required this.ingredient7,
    required this.measure7,
  });


//this is the function that is used to convert the json data into the Drink class
 factory Drink.fromJSON(Map<String, dynamic> json) {

//Initially tried to use a for loop to create an array of ingredients and measures, but this was not working, so have used ingredients and measure up to 7, as no cocktail seems to have more than 7 ingredients
  // List<String> ingredientList = [];
  // List<String> measureList = [];

  // for (int i = 0; i <=15; i++) {
  //   String ingredient = json['strIngredient$i'];
   
  //   String measure = json['strMeasure$i'];
  //   if (ingredient != null && ingredient.isNotEmpty && measure != null && measure.isNotEmpty) {
  //     ingredientList.add(ingredient);
  //     measureList.add(measure);
  //   }
  // }

  return Drink(
    name: json['strDrink'] ?? '',
    instructions: json['strInstructions'] ?? '',
    image: json['strDrinkThumb'] ?? '',
   
    ingredient1: json['strIngredient1'] ?? '',
    measure1: json['strMeasure1'] ?? '',
    ingredient2: json['strIngredient2'] ?? '',
    measure2: json['strMeasure2'] ?? '',
    ingredient3: json['strIngredient3'] ?? '',
    measure3: json['strMeasure3'] ?? '',
    ingredient4: json['strIngredient4'] ?? '',
    measure4: json['strMeasure4'] ?? '',
    ingredient5: json['strIngredient5'] ?? '',
    measure5: json['strMeasure5'] ?? '',
    ingredient6: json['strIngredient6'] ?? '',
    measure6: json['strMeasure6'] ?? '',
    ingredient7: json['strIngredient7'] ?? '',
    measure7: json['strMeasure7'] ?? '',
  );
}
}
class DrinkService {
  Future<Drink> fetchCocktails() async {
    final response = await http.get(Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> drinkList = body['drinks'];

       if (drinkList.isNotEmpty) {
        final entry = drinkList[0];
        return Drink.fromJSON(entry);
      } else {
        throw Exception('No drinks found');
      }

    
    } else {
      throw Exception('Failed to load cocktail');
    }
  }
}


