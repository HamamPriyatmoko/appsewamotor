import 'package:appsewamotor/widgets/HomeAppBar.dart';
import 'package:appsewamotor/widgets/categoriesitem.dart';
import 'package:appsewamotor/widgets/listmenu.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = '';

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  void _onCategoryTap(String category) {
    setState(() {
      _selectedCategory = category;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Category tapped: $category')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeAppBar(),
          Container(
            padding: const EdgeInsets.only(top: 15),
            decoration: const BoxDecoration(
              color: Color.fromARGB(34, 91, 86, 86),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Column(
              children: [
                //Search Widget
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Here...",
                          ),
                          onChanged: (query) => _updateSearchQuery(query),
                        ),
                      ),
                      const Icon(Icons.search),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                CategoriesItem(onCategoryTap: _onCategoryTap),
                //Slider Widget
                SizedBox(height: 25),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 15, bottom: 10),
                      child: Text("New Collection",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20)),
                    )
                  ],
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 290.0, //tinggi card slide
                    autoPlay: true,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    'https://www.yamaha-motor.co.id/uploads/products/featured_image/2023102519190474792T91675.png',
                    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//95/MTA-71376340/yamaha_yamaha_full01.jpg',
                    'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//101/MTA-62683319/yamaha_yamaha-mx-king-150_full00_62428B5E-9473-49B5-B2E3-532C4039BF1E.jpg',
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Card(
                          margin: EdgeInsets.all(5),
                          elevation: 5,
                          child: Container(
                            width: 450, // lebar card slide
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(i),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
                //item widget
                SizedBox(height: 25),
                Container(
                  // Batasi tinggi ListView agar tidak memakan semua ruang
                  child: ListMenu(
                    searchQuery: _searchQuery,
                    selectedCategory: _selectedCategory,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
