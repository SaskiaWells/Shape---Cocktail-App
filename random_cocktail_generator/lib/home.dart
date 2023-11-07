import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_cocktail_generator/cocktail.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //created app bar to sit on top of page
      appBar: AppBar(
        title: Text('Random Cocktail Generator'),
      ),
      //created a button to generate a random cocktail
      // this will be replaced with a cocktail shaker that the user will shake to generate a random cocktail
      body: Center(
        child: ElevatedButton(
  onPressed: () {
    
    //this navigates to the second page which gie the recipefor the random cocktail generated
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Cocktail()),
    );
   
  },
  child: Text('Press me'),
),) 

      

       
    );
  }
}