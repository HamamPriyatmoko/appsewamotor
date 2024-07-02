import 'package:appsewamotor/screen/profilescreen.dart';
import 'package:appsewamotor/screen/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final username = userProvider.name;
    final profilePicture = userProvider.profilePicture;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Scaffold.of(context)
                  .openDrawer(); // Membuka drawer saat ikon "sort" diklik
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              // Atau navigasi ke halaman profil
              // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Row(
              children: [
                Text(
                  "Hi, $username  ",
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
                  child: CircleAvatar(
                    backgroundImage: profilePicture.isNotEmpty
                        ? NetworkImage(profilePicture) as ImageProvider
                        : AssetImage('assets/images/default_profile.jpg'),
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
