import 'package:http/http.dart' as http;
import 'dart:convert';

class DrinkName {
  final String name;

  const DrinkName({
    required this.name,
  });

  factory DrinkName.fromJSON(Map<String, dynamic> json) {
    return DrinkName(
      name: json['strDrink'],
    );
  }
}

class DrinkNameService {
  Future<DrinkName> fetchCocktailName() async {
    final response = await http.get(
        Uri.parse('https://www.thecocktaildb.com/api/json/v1/1/random.php'));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final List<dynamic> drinkList = body['drinks'];

      return DrinkName.fromJSON(drinkList[0]);
    } else {
      throw Exception('Failed to load cocktail');
      
    }
  }
}
