import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/screens/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF161B33),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF161B33),
          secondary: Color(0xFF0D0C1D),
        )
        
   
      ),
  
debugShowCheckedModeBanner: false,


      home: HomePage(),
    );
  }
}


