import 'package:flutter/material.dart';

class AssignedCard extends StatelessWidget {
  AssignedCard({super.key,required this.tablenumber});
  var tablenumber;
  @override
  Widget build(BuildContext context) {

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        color: Colors.grey,
        height: 100,
        width: 100,
        child: Center(child: Text(tablenumber.toString())),
      ),
    );
  }
}
