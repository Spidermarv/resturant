import "package:flutter/material.dart";


class Headline extends StatelessWidget {
  const Headline({super.key});

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.red,
        width: 350,
        height: 200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                const SizedBox(height: 50,),
                const Text("Today's Specials"),
                const Text("25% off"),
                ElevatedButton(onPressed: (){}, child: const Text("Buy Now"))
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
                child: const Image(image:AssetImage("Assets/meal.jpg"), fit: BoxFit.contain, width: 150,height:150)),
          ],
        ),
      
      ),
    );
  }
}
