import 'package:appsewamotor/screen/loginscreen.dart';
import 'package:flutter/material.dart';

class RegistrasiScreen extends StatefulWidget {
  const RegistrasiScreen({super.key});

  @override
  State<RegistrasiScreen> createState() => _RegistrasiScreenState();
}

class _RegistrasiScreenState extends State<RegistrasiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 40),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 120),
                        child: Text(
                          'Hi!',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Create a new account',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 55.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 55.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 55.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 80),
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 2 * 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.lightBlue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
