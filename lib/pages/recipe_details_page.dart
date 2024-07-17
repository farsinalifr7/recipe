// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:recipe/pages/home_page.dart';

import 'package:recipe/pages/model/recipe_model.dart';

class RecipeDetailsPage extends StatelessWidget {
  final Recipe recipe;
  const RecipeDetailsPage({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Stack(
          children: [
            SizedBox(
              child: Image.network(recipe.image),
            ),
            Positioned(
              top: 25,
              left: 15,
              child: IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 30,
                  )),
            ),
            Positioned(
                left: 70,
                top: 30,
                child: Container(
                  child: Text(
                    recipe.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      color: Colors.grey[100],
                      letterSpacing: 2,
                    ),
                  ),
                )),
            Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                  child: Text(
                    "${recipe.rating}⭐",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[100],
                      letterSpacing: 2,
                    ),
                  ),
                )),
            Positioned(
                left: 10,
                bottom: 10,
                child: Container(
                  child: Text(
                    "${recipe.cookTimeMinutes} minutes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.grey[100],
                      letterSpacing: 2,
                    ),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Ingredients",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.vertical,
                        itemCount: recipe.ingredients.length,
                        itemBuilder: (context, index) {
                          return Text(
                            recipe.ingredients[index],
                            style: TextStyle(color: Colors.grey[600]),
                          );
                        })),
                const Text(
                  "Instructions",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    //color: Colors.grey[100],
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                    height: 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: recipe.instructions.length,
                        itemBuilder: (context, index) {
                          return Text(
                            recipe.instructions[index],
                            style: TextStyle(color: Colors.grey[600]),
                          );
                        })),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
