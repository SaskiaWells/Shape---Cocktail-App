import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:random_cocktail_generator/screens/cocktail.dart';
import 'package:drop_shadow/drop_shadow.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        //created app bar to sit on top of page
        appBar: AppBar(
          title: const Text('Random Cocktail Generator'),
        ),


// wrapping the whole body in a container allows for the gradient background
        body: Container(

            //this make the backgorund gradient
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF474973), Color(0xFFBB0A21)])),
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

                    //this allows the navigation to the cocktail page when drag is released
                    onDragEnd: (drag) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Cocktail()),
                      );
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



