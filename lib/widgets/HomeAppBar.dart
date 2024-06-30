import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context).openDrawer(); // Membuka drawer saat ikon "sort" diklik
            },
            child: Icon(
              Icons.sort,
              size: 30,
              color: Colors.deepPurpleAccent,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              "Remo",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Profile tapped')),
              );
              // Atau navigasi ke halaman profil
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Row(
              children: [
                Text(
                  "Hi, Hamam  ",
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.deepPurpleAccent,
                      width: 3.0,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/images/vario.jpg'),
                    radius: 25,
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
