import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  // Variabel untuk menyimpan indeks item yang dipilih
  int _selectedIndex = 0;

  // Fungsi untuk menangani ketika item diketuk
  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Implementasi navigasi atau aksi untuk setiap item menu di sini
    switch (index) {
      case 0:
        // Implementasi untuk menu Beranda
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Beranda')),
        );
        break;
      case 1:
        // Implementasi untuk menu Log Out
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Log Out')),
        );
        break;
      case 2:
        // Implementasi untuk menu Pengaturan
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Pengaturan')),
        );
        break;
    }
  }

  // Widget untuk membangun item menu
  Widget buildMenuItem({
    required int index,
    required IconData icon,
    required String title,
  }) {
    return InkWell(
      // Ketika item diketuk, panggil _onItemTap dengan indeks item
      onTap: () => _onItemTap(index),
      child: Container(
        // Ubah warna latar belakang jika item dipilih dan tambahkan radius melingkar
        decoration: BoxDecoration(
          color: _selectedIndex == index ? Colors.blueGrey : Colors.transparent,
          borderRadius:
              BorderRadius.circular(12), // Menambahkan radius melingkar
        ),
        margin: EdgeInsets.symmetric(
            vertical: 5), // Menambahkan margin untuk setiap item
        child: ListTile(
          // Ikon untuk item menu
          leading: Icon(
            icon,
            color: Colors.white,
          ),
          // Judul untuk item menu
          title: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 10),
              ListTile(
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: Colors.white24,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "Hamam Priyatmoko",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, top: 20),
                child: Row(
                  children: [
                    Text(
                      "Browse".toUpperCase(),
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Divider(
                  color: Colors.white,
                  height: 1,
                ),
              ),
              // Membuat item menu menggunakan fungsi buildMenuItem
              buildMenuItem(
                  index: 0, icon: Icons.home, title: "Beranda"),
              buildMenuItem(
                  index: 1, icon: Icons.logout, title: "Log Out"),
              buildMenuItem(
                  index: 2, icon: Icons.settings, title: "Pengaturan"),
            ],
          ),
        ),
      ),
    );
  }
}
