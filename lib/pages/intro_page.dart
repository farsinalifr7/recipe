import 'package:flutter/material.dart';
import 'package:recipe/pages/home_page.dart';

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  IntroPage({super.key});

  List images = [
    "asset/images/diet.png",
    "asset/images/food.png",
    "asset/images/pour.png",
    "asset/images/cook.png",
    "asset/images/balanced-diet.png",
    "asset/images/salad.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            // const Text(
            //   "Welcome to Recipe App",
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            SizedBox(
              height: 300,
              width: double.infinity,
              child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(7),
                      child: SizedBox(
                        //height: 200,
                        //color: Colors.grey,
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            // const Text(
            //   "Discover thousands of delicious recipes from around the world.",
            //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            // ),
            const Text(
              "Welcome to Recipe App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),

            const Text(
              "Easily save and organize your favorite recipes for quick access anytime.",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const Text(
              "Discover thousands of delicious recipes from around the world.",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const Text(
              "Enjoy step-by-step cooking guides with photos and videos for perfect results every time.",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const CircleAvatar(
                  radius: 40,
                  child: Center(child: Icon(Icons.arrow_forward_ios)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
