import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_cocktail_generator/cocktail.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Cocktail Generator'),
      ),
      body: Center(
        child: ElevatedButton(
  onPressed: () {
    // Put your code here to be executed when the button is pressed.
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Cocktail()),
    );
    print('Button pressed!');
  },
  child: Text('Press me'),
),) 

      

       
    );
  }
}