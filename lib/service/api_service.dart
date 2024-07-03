import 'dart:convert';
import 'dart:io';
import 'package:appsewamotor/screen/adminscreen/model/Produk.dart';
import 'package:http/http.dart' as http;

class apiservice {
  static const String baseUrl =
      'http://10.0.2.2:8000/api'; // Sesuaikan URL sesuai dengan endpoint API Anda

  // Metode untuk menangani panggilan API login
  static Future<Map<String, dynamic>?> login(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal melakukan login');
    }
  }

  // Metode untuk menangani panggilan API registrasi
  static Future<Map<String, dynamic>?> register(String username, String email,
      String password, String confirmPassword) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'name': username,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
      }),
    );

    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal melakukan registrasi');
    }
  }

  // Metode untuk mengambil daftar produk dari API
  static Future<List<Map<String, dynamic>>> fetchProducts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/product'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        print("Data produk berhasil diambil: $data"); // Debugging line

        return data
            .map((item) => {
                  'image': item[
                      'gambar'], //yang didalam item merupakan nama atribut yang ada di database
                  'title': item['nama'],
                  'description': item['deskripsi'],
                  'harga': item['harga'],
                  'jenis': item['jenis'],
                })
            .toList();
      } else {
        print("Gagal memuat data. Status code: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      print("Terjadi kesalahan saat mengambil data produk: $e");
      return [];
    }
  }

  static Future<Map<String, dynamic>> adminLogin(
      String email, String password) async {
    final url = Uri.parse('$baseUrl/admin/login');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Gagal melakukan login');
    }
  }

  Future<Map<String, dynamic>?> uploadImage(File image) async {
    final request = http.MultipartRequest('POST', Uri.parse('$baseUrl/upload'));
    request.files.add(await http.MultipartFile.fromPath('gambar', image.path));
    final response = await request.send();

    if (response.statusCode == 200) {
      final responseData = await response.stream.bytesToString();
      return jsonDecode(responseData);
    } else {
      return null;
    }
  }

  // Metode untuk menambah produk baru
  Future<http.Response> addProduct(Produk produk) async {
    final response = await http.post(
      Uri.parse('$baseUrl/product'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(produk.toJson()),
    );
    return response;
  }
}
