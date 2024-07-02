import 'package:appsewamotor/screen/adminscreen/loginadmin.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class SideMenuUtama extends StatefulWidget {
  const SideMenuUtama({Key? key}) : super(key: key);

  @override
  State<SideMenuUtama> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenuUtama> {
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginAdminScreen()),
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
            vertical: 15,
            horizontal: 15), // Menambahkan margin untuk setiap item
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
              SizedBox(
                height: 20,
              ),
              // Membuat item menu menggunakan fungsi buildMenuItem
              buildMenuItem(
                  index: 0,
                  icon: LineAwesomeIcons.person_booth_solid,
                  title: "Login Admin"),
            ],
          ),
        ),
      ),
    );
  }
}
