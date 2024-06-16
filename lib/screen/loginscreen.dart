import 'package:appsewamotor/screen/menuscreen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Welcome !',
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'Please login to continue',
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
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                  ),
                ),
                SizedBox(height: 30),
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
                      // Add your login logic here
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()));
                    },
                    child: Text('Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Forgot Password?')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
