import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe/pages/model/recipe_model.dart';
import 'package:recipe/pages/recipe_details_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> recipes = [];
  @override
  void initState() {
    super.initState();
    RecipeItems();
  }

  RecipeItems() async {
    var res = await http.get(Uri.parse('https://dummyjson.com/recipes'));
    try {
      if (res.statusCode == 200) {
        var data = recipeModelFromJson(res.body);

        setState(() {
          recipes = data.recipes;
          print(recipes);
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Find Your",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w300),
                        ),
                        const Text(
                          "Favorite Food",
                          style: TextStyle(
                              fontSize: 27, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const TextField(
                            //onChanged: (value) => runFilter(value),
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              border: InputBorder.none,
                              hintText: "Find your Food ",
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // const Align(
                        //     alignment: Alignment.centerRight,
                        //     child: Text("See All"))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 5,
                child: Container(
                  color: Colors.grey[100],
                  child: ListView.builder(
                      itemCount: recipes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: InkWell(
                            onTap: () {
                              // Navigate to RecipeDetails Page
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RecipeDetailsPage(
                                    recipe: recipes[index],
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 170,
                                    width: 400,
                                    child: Image.network(
                                      recipes[index].image,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Text(
                                    recipes[index].name,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
