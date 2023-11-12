import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/API%20calls/drink.dart';

import 'package:random_cocktail_generator/screens/cocktail.dart';
import 'package:drop_shadow/drop_shadow.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Drink> cocktail;

 void resetCocktail() {
  setState(() {
    cocktail = DrinkService().fetchCocktails();
  });
}
  @override
  void initState() {
    super.initState();
    cocktail = DrinkService().fetchCocktails();
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //created app bar to sit on top of page
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Random Cocktail Generator',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
        ),

// wrapping the whole body in a container allows for the gradient background
        body: Container(

            //this make the backgorund gradient
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF161B33), Color(0xFFBB0A21)])),
            child: Center(
              //column stacks the widgets on top of each other
              child: Column(
                children: [
                  //this container is used to add padding to the top and bottom of the text
                  Container(
                      margin: const EdgeInsets.only(top: 100, bottom: 100),
                      child: const Text(
                        'Shake to generate a drink',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )),

                  //this is an image that is draggable, when the drag is releses it will navigate to the cocktail page, this is done using the onDragEnd function
                  Draggable(
                    //Dropshadow adds a glow to the image
                    feedback: DropShadow(
                      blurRadius: 10,
                      offset: const Offset(3, 3),
                      spread: 3,
                      child: Image.asset(
                        '../../assets/transparent2.png',
                        height: 500,
                        width: 500,
                      ),
                    ),
                    childWhenDragging: Opacity(
                      opacity: 0,
                      child: Container(),
                    ),

                    //this shows the user the name of the cocktial generated, also give them the choice to shake again or go to the cocktail page
                    onDragEnd: (drag) {
                      showDialog(
                          context: context,
                          builder: (context) => FutureBuilder<Drink>(
                                future: cocktail,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return AlertDialog(
                                      contentPadding: const EdgeInsets.all(20),
                                      backgroundColor: const Color(0xFF161B33),
                                      title: const Text('Your Drink is a', style: TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
                                      content: Text('${snapshot.data!.name}!', style: const TextStyle(color: Colors.white, fontSize: 20), textAlign: TextAlign.center),
                                      actions: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  resetCocktail();
                                                  Navigator.pop(context);
                                                },
                                                child:
                                                    const Text('Shake Again', style: TextStyle(color: Colors.white),)),
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const Cocktail(),
                                                        settings: RouteSettings(
                                                          //this send the data to the cocktail page that we fetched from the api call
                                                            arguments:
                                                                cocktail)));
                                              },
                                              child: const Text('Recipe', style: TextStyle(color: Colors.white)),
                                            )
                                          ],
                                        )
                                      ],
                                    );
                                  } else {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ));

                     
                    },
                    child: DropShadow(
                      blurRadius: 20,
                      offset: const Offset(3, 3),
                      spread: 3,
                      child: Image.asset(
                        '../../assets/transparent2.png',
                        height: 500,
                        width: 500,
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
