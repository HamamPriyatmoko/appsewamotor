import 'package:appsewamotor/screen/adminscreen/admindetailscreen.dart';
import 'package:appsewamotor/screen/adminscreen/widget/imageplaceholde.dart';
import 'package:appsewamotor/service/api_service.dart';
import 'package:flutter/material.dart';

class AdminMenu extends StatefulWidget {
  final String searchQuery;

  AdminMenu({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  @override
  AdminMenuState createState() => AdminMenuState();
}

class AdminMenuState extends State<AdminMenu> {
  List<Map<String, dynamic>> items = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    setState(() {
      isLoading = true;
    });
    try {
      final List<Map<String, dynamic>> fetchedItems =
          await apiservice.fetchProducts();

      setState(() {
        items = fetchedItems;
        isLoading = false;
      });
    } catch (e) {
      print("Error occurred while fetching data: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final filteredItems = items.where((item) {
      final title = item['title']!.toLowerCase();
      final description = item['description']!.toLowerCase();
      final harga = item['harga']!.toLowerCase();
      final jenis = item['jenis']!.toLowerCase();
      final searchQuery = widget.searchQuery.toLowerCase();

      return (title.contains(searchQuery) ||
          description.contains(searchQuery) ||
          harga.contains(searchQuery) ||
          jenis.contains(searchQuery));
    }).toList();

    const stars = Row(
      children: [
        Icon(Icons.star, color: Color.fromARGB(255, 101, 67, 180)),
        Icon(Icons.star, color: Color.fromARGB(255, 101, 67, 180)),
        Icon(Icons.star, color: Color.fromARGB(255, 101, 67, 180)),
        Icon(Icons.star, color: Colors.black),
        Icon(Icons.star, color: Colors.black),
      ],
    );

    final ratings = Container(
      padding: const EdgeInsets.only(top: 8, bottom: 10),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          Text(
            '170 Reviews',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 17,
            ),
          ),
        ],
      ),
    );

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminDetailsScreen(item: item),
              ),
            );
          },
          child: Card(
            margin: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(8),
                      height: 180,
                      width: 350,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color.fromARGB(255, 255, 255, 255)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ImageWithPlaceholder(
                          imageUrl: item['image']!,
                          width: 350,
                          height: 180,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 5, left: 30),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${item['title']}',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 15, left: 30),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    item['description']!,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      text: 'From ',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 101, 67, 180),
                          fontSize: 15),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Rp${item['harga']!}',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 101, 67, 180),
                                fontSize: 20)),
                        const TextSpan(
                            text: '/day',
                            style: TextStyle(
                                color: Color.fromARGB(255, 101, 67, 180),
                                fontSize: 15)),
                      ],
                    ),
                  ),
                ),
                ratings
              ],
            ),
          ),
        );
      },
    );
  }
}