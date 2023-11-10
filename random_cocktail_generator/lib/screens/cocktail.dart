import 'package:borders/borders.dart';
import 'package:flutter/material.dart';
import 'package:random_cocktail_generator/API%20calls/drink.dart';

class Cocktail extends StatefulWidget {
  const Cocktail({Key? key}) : super(key: key);

  @override
  _CocktailState createState() => _CocktailState();
}

class _CocktailState extends State<Cocktail> {
//adjusted api call to use the Drink class
  late Future<Drink> cocktail;

  @override
  void initState() {
    super.initState();
    cocktail = DrinkService().fetchCocktails();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
centerTitle: true,
          title: const Text('Cocktail recipe',
           style: TextStyle(color: Colors.white,  fontSize: 30)),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          //this makes the backgorund gradient
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  colors: [Color(0xFF464772), Color(0xFF0D0C1D)])),

          //this is the container that holds the cocktail information

          child:
          //single child scroll view allows the page to be scrollable
           SingleChildScrollView(
                child:
                Center(
            //using the future builder to display the data from the api call
              child: 
              FutureBuilder<Drink>(
                
                  future: cocktail,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Image(
                            image: NetworkImage(
                              snapshot.data!.image,
                            ),
                            fit: BoxFit.fitWidth,
                          ),
                          
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 20, 20, 20),
                            decoration: const BoxDecoration(
                              color: Color(0xFF0D0C1D),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(children: [
                              Title(
                                  color: const Color(0xFFFFFFFA),
                                  child: Text(
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFFFFA)),
                                      snapshot.data!.name)),
                              Divider(
                                color: Colors.white.withOpacity(0.5),
                                thickness: 1,
                                height: 20,
                              ),
                              Container(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Column(children: [
                                    const Text('Ingredients',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFFFFFFA))),
                                    Divider(
                                      color: Colors.white.withOpacity(0.3),
                                      thickness: 1,
                                      height: 10,
                                    ),
                                    Container(
                                        margin: const EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        child: Column(children: [

                                          //This is written explictly, could be refactored to loop each ingredient and measure to be more implicit and to remove null values
                                          Text(
                                              '${snapshot.data!.measure1} ${snapshot.data!.ingredient1}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                          Text(
                                              '${snapshot.data!.measure2} ${snapshot.data!.ingredient2}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                          Text(
                                              '${snapshot.data!.measure3} ${snapshot.data!.ingredient3}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                          Text(
                                              '${snapshot.data!.measure4} ${snapshot.data!.ingredient4}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                          Text(
                                              '${snapshot.data!.measure5} ${snapshot.data!.ingredient5}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                          Text(
                                              '${snapshot.data!.measure6} ${snapshot.data!.ingredient6}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                          Text(
                                              '${snapshot.data!.measure7} ${snapshot.data!.ingredient7}',
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFFFFA))),
                                        ])
                                        )
                                  ])),
                              Divider(
                                color: Colors.white.withOpacity(0.5),
                                thickness: 1,
                                height: 20,
                              ),
                              Container(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Text(
                                      style: const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFFFFA)),
                                      snapshot.data!.instructions))
                            ]),
                          )
                         
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  })
               
              
              
              ), )
        ));
  }
}
