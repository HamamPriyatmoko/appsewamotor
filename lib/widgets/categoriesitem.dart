import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=0; i<3; i++)
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/aerox.png',
                  width: 40,
                  height: 40,
                ),
                Text(
                  "Motor",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
