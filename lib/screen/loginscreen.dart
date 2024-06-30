
import 'package:appsewamotor/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:appsewamotor/screen/menuscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isLoading = true;
      });

      try {
        final responseData = await apiservice.login(
          _emailController.text,
          _passwordController.text,
        );

        setState(() {
          _isLoading = false;
        });

        // Handle login success
        final token = responseData!['token'];
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });

        // Handle login failure
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Login gagal: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
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
            SizedBox(height: 40),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 30),
                _isLoading
                    ? CircularProgressIndicator()
                    : Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 2 * 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: _login,
                          child: Text('Login',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w500)),
                        ),
                      ),
                SizedBox(height: 20),
                Text('Forgot Password?')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
