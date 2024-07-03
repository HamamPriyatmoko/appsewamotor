import 'package:appsewamotor/provider/userprovider.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _telephoneController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    _usernameController.text = userProvider.name;
    // You may add more initializations for address, telephone, and gender if they are part of UserProvider
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final profilePicture = userProvider.profilePicture;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(LineAwesomeIcons.angle_left_solid),
        ),
        title: Container(
          padding: EdgeInsets.only(right: 25),
          child: Center(
            child: Text(
              'Edit Profile',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: profilePicture.isNotEmpty
                          ? Image.network(profilePicture)
                          : Image.asset("assets/images/default_profile.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black),
                      child: Icon(
                        LineAwesomeIcons.camera_solid,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        label: Text("Username"),
                        prefixIcon: Icon(LineAwesomeIcons.user),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        label: Text("Address"),
                        prefixIcon: Icon(LineAwesomeIcons.address_card),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _telephoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        label: Text("Telephone"),
                        prefixIcon: Icon(LineAwesomeIcons.phone_solid),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextFormField(
                      controller: _genderController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        label: Text("Gender"),
                        prefixIcon: Icon(LineAwesomeIcons.genderless_solid),
                      ),
                    ),
                    SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          // Update the user profile information
                          userProvider.setName(_usernameController.text);
                          // Add more update methods for address, telephone, gender if needed

                          // Show a success message
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Profile updated successfully!')),
                          );

                          // Navigate back to the previous screen
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Save",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
