import 'package:appsewamotor/screen/editscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            // Tambahkan fungsi untuk kembali ke halaman sebelumnya
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Container(
          padding: EdgeInsets.only(right: 28),
          child: Center(
            child: Text(
              'Profile',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("assets/images/aerox.png"),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.deepPurpleAccent),
                      child: Icon(
                        LineAwesomeIcons.camera_solid,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Nama Pengguna",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                "hamam@gmail.com",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfileScreen(),
                      ),
                    );
                    // Tambahkan fungsi untuk navigasi ke halaman edit profile
                  },
                  child: Text("Edit Profile"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
