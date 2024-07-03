import 'package:appsewamotor/screen/adminscreen/updatescreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> item;

  const AdminDetailsScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Here the desired height
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Image.network(
                    item['image']!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 16,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {
                            // Share action
                          },
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            // Favorite action
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 16,
                  right: 16,
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                    padding: const EdgeInsets.all(5),
                    child: const Text(
                      "+7",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title']!,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    item['description']!,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        'From ',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        item['harga']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                          fontSize: 20,
                        ),
                      ),
                      const Text(
                        ' Rp150.000',
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
                      const Text(
                        '/day',
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Period',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            child: const Column(children: [
                              Text(
                                  'Motor ini memungkinkan pemesanan tanpa durasi'),
                            ]),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: const Text("Thu, 27 Jun"),
                          ),
                          Icon(Icons.arrow_circle_right),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Text("Fri, 28 Jun"),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        item['harga']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => UpdateData()));
                          },
                          child: Text('Update'),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Next action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 196, 78, 217),
                          ),
                          child: Text(
                            'Delete',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
