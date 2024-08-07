import 'dart:io';

import 'package:appsewamotor/screen/adminscreen/model/Produk.dart';
import 'package:appsewamotor/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  File? _image;
  final _imagePicker = ImagePicker();
  final apiservice _apiService = apiservice();

  final _formkey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _jenisController = TextEditingController();
  final _hargaController = TextEditingController();

  Future<void> getImage() async {
    final XFile? pickerFile =
        await _imagePicker.pickImage(source: ImageSource.gallery);

    setState(
      () {
        if (pickerFile != null) {
          _image = File(pickerFile.path);
        } else {
          print("No image selected");
        }
      },
    );
  }

  Future<void> _uploadImageAndData() async {
    if (_formkey.currentState!.validate() && _image != null) {
      try {
        // Upload gambar terlebih dahulu
        final uploadResponse = await _apiService.uploadImage(_image!);
        if (uploadResponse != null) {
          final imageUrl = uploadResponse['url'];

          // Buat instance produk dengan URL gambar
          final produk = Produk(
            nama: _namaController.text,
            deskripsi: _deskripsiController.text,
            jenis: _jenisController.text,
            harga: _hargaController.text,
            gambar: imageUrl,
          );

          // Kirim data produk ke backend
          final response = await _apiService.addProduct(produk);

          if (response.statusCode == 200) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Produk berhasil ditambahkan')),
            );
            Navigator.pop(context);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Gagal menambahkan produk')),
            );
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengunggah gambar: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form atau gambar tidak boleh kosong')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Kendaraan"),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 200, 210, 214),
      ),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: _image == null
                    ? const Center(
                        child: Text("Tidak ada gambar yang dipilih"),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.scaleDown,
                          width: 200,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 35),
                child: ElevatedButton(
                  onPressed: getImage,
                  child: const Text("Pilih Gambar"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Nama", hintText: "Masukkan Nama"),
                  controller: _namaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Deskripsi", hintText: "Masukkan Deskripsi"),
                  controller: _deskripsiController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Deskripsi tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Merk", hintText: "Masukkan Merk"),
                  controller: _jenisController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Merk tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Harga", hintText: "Masukkan Harga"),
                  controller: _hargaController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Harga tidak boleh kosong';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: _uploadImageAndData,
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
