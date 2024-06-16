import 'package:appsewamotor/screen/loginscreen.dart';
import 'package:appsewamotor/screen/registrasiscreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Remo")),),
      body: Center(
        child: Column(
          children: [
            const Image(
              image: NetworkImage(
                  'https://i.pinimg.com/564x/c5/42/8f/c5428ff5e4e29ac2f985f36c25be9b11.jpg'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Hello !',
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text('Welcome To Our Apps The best place to rent a motorbike'),
            Text('  is just to order the motorbike and it is ready to be used'),
            SizedBox(
              height: 60,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                },
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width - 2 * 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrasiScreen()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
