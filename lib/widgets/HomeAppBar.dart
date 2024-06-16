import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Remo",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
