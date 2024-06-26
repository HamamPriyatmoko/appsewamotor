import 'package:flutter/material.dart';

class CategoriesItem extends StatelessWidget {
  final Function(String) onCategoryTap;

  const CategoriesItem({Key? key, required this.onCategoryTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = ['Yamaha', 'Honda', 'Suzuki']; // Contoh kategori

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return GestureDetector(
            onTap: () => onCategoryTap(category),
            child: Container(
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
                    'assets/images/aerox.png', // Ganti dengan path gambar yang sesuai
                    width: 40,
                    height: 40,
                  ),
                  Text(
                    category,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
