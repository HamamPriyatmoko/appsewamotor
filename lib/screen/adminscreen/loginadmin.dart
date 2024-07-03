import 'package:appsewamotor/screen/adminscreen/homepage_admin.dart';
import 'package:flutter/material.dart';
import 'package:appsewamotor/service/api_service.dart';

class LoginAdminScreen extends StatefulWidget {
  const LoginAdminScreen({Key? key}) : super(key: key);

  @override
  State<LoginAdminScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginAdminScreen> {
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
        final responseData = await apiservice.adminLogin(
          // Menggunakan metode adminLogin dari apiservice
          _emailController.text,
          _passwordController.text,
        );

        setState(() {
          _isLoading = false;
        });

        // Handle login success
        final token = responseData[
            'token']; // Pastikan struktur respons dari backend sesuai dengan yang Anda harapkan

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  const HomeAdmin()), // Ganti dengan halaman setelah login sukses
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: const Center(
                  child: Column(
                    children: [
                      Text(
                        'Login Admin',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
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
      ),
    );
  }
}
