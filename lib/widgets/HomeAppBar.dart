import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              // Aksi yang ingin dilakukan ketika ikon ditekan
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Menu icon tapped')),
              );
            },
            child: Icon(
              Icons.sort,
              size: 30,
              color: Colors.blue,
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
              // Aksi yang ingin dilakukan ketika profil ditekan
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
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/vario.jpg'),
                  radius: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
