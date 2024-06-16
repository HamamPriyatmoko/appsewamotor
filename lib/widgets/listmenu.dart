import 'package:appsewamotor/screen/detailsscreen.dart';
import 'package:flutter/material.dart';

class ListMenu extends StatefulWidget {
  final String searchQuery;

  // Konstruktor untuk widget ListMenu
  const ListMenu({Key? key, required this.searchQuery}) : super(key: key);

  @override
  State<ListMenu> createState() => _ListMenuState();
}

class _ListMenuState extends State<ListMenu> {
  final List<Map<String, String>> items = [
    {
      'image':
          'https://www.yamaha-motor.co.id/uploads/products/featured_image/2023102519190474792T91675.png',
      'title': 'Yamaha Aerox 2021',
      'description': 'Deskripsi untuk gambar 1',
      'harga': '50.000'
    },
    {
      'image':
          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//95/MTA-71376340/yamaha_yamaha_full01.jpg',
      'title': 'Vario 2011',
      'description': 'Deskripsi untuk gambar 2',
      'harga': '70.000'
    },
    {
      'image':
          'https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//101/MTA-62683319/yamaha_yamaha-mx-king-150_full00_62428B5E-9473-49B5-B2E3-532C4039BF1E.jpg',
      'title': 'Jupiter 2018',
      'description': 'Deskripsi untuk gambar 3',
      'harga': '90.000'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = items.where((item) {
      final title = item['title']!.toLowerCase();
      final description = item['description']!.toLowerCase();
      final harga = item['harga']!.toLowerCase();
      final searchQuery = widget.searchQuery.toLowerCase();

      return title.contains(searchQuery) ||
          description.contains(searchQuery) ||
          harga.contains(searchQuery);
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
      physics: NeverScrollableScrollPhysics(),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(item: item),
              ),
            );
          },
          child: Card(
            margin: EdgeInsets.all(12),
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
                          color: const Color.fromARGB(255, 54, 52, 52)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          item['image']!,
                          width: 50, // Lebar gambar
                          height: 100, // Tinggi gambar
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
                    item['title']!, // Teks judul
                    style: const TextStyle(
                      fontSize: 20, // Ukuran font judul
                      fontWeight: FontWeight.bold, // Ketebalan font judul
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
                    item['description']!, // Teks deskripsi
                    style: const TextStyle(
                      fontSize: 14, // Ukuran font deskripsi
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
                    // "From " + item['harga']!, // Teks deskripsi
                    // style: TextStyle(
                    //   fontSize: 14, // Ukuran font deskripsi
                    // ),
                    TextSpan(
                      text: 'From ',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 101, 67, 180),
                          fontSize: 15), // default text style
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