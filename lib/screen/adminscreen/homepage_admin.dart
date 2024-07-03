import 'package:appsewamotor/screen/adminscreen/widget/adminmenu.dart';
import 'package:appsewamotor/screen/adminscreen/widget/slider_menu.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.black, child: Text("Remo")),
      ),
      body: ListView(
        children: [
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
                SizedBox(
                  height: 15,
                ),
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
                SliderMenu(),
                SizedBox(
                  height: 12,
                ),
                AdminMenu(searchQuery: _searchQuery)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
