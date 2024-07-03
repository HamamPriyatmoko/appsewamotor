class Produk {
  String nama;
  String deskripsi;
  String jenis;
  String harga;
  String gambar;

  Produk({
    required this.nama,
    required this.deskripsi,
    required this.jenis,
    required this.harga,
    required this.gambar,
  });

  Map<String, dynamic> toJson() {
    return {
      'nama': nama,
      'deskripsi': deskripsi,
      'merk': jenis,
      'harga': harga,
      'imageUrl': gambar,
    };
  }
}
