import 'dart:io';

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

  final _formkey = GlobalKey<FormState>();
  final _namaController = TextEditingController();
  final _deskripsiController = TextEditingController();
  final _jenisController = TextEditingController();
  final _hargaController = TextEditingController();

  // final KontakController _personController = KontakController();

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
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 35),
                child: ElevatedButton(
                  onPressed: () {
                    getImage();
                  },
                  child: const Text("Pilih Gambar"),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Nama", hintText: "Masukkan Nama"),
                  controller: _namaController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Deskripsi", hintText: "Masukkan Deskripsi"),
                  controller: _deskripsiController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Merk", hintText: "Masukkan Merk"),
                  controller: _jenisController,
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "Harga", hintText: "Masukkan Harga"),
                  controller: _hargaController,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {},
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
