import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 390,
        height: 100,
        color: Colors.red,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(width: 20,),
            Row(children: [
              ClipRRect(
                  child: const Image(image: AssetImage("Assets/dish1.jpg"),
                    width: 100, height: 100,fit: BoxFit.contain,),
                borderRadius: BorderRadius.circular(20),
              ),
            ],),
            const SizedBox(width: 20,),
            const Column(
              children: [
                SizedBox(height: 30,),
                Text("Food"),
                SizedBox(height: 5,),
                Text("2000")
              ],
            ),
            const SizedBox(width: 20,),
            Column(
              children: [
                const SizedBox(height: 30,),
                Row(
                  children: [
                    const SizedBox(width: 20,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white,
                        width: 30,
                        height: 30,
                        child: const Center(child: Text("-",style: TextStyle(fontSize: 20),)),
                      ),
                    ),
                    const SizedBox(width: 5,),
                    const Text("1",style: TextStyle(fontSize: 20),),
                    const SizedBox(width: 5,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.white,
                        width: 30,
                        height: 30,
                        child: const Center(child: Text("+",style: TextStyle(fontSize: 20),)),
                      ),
                    ),
                    const SizedBox(width: 20,),
                    const SizedBox(width: 20,),
                  ],
                )
              ],
            )

          ],
        ),
      ),
    );
  }
}
