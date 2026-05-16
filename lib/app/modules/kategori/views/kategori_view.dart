import 'package:flutter/material.dart';
import 'tambah_kategori_view.dart'; // ✅ import halaman tambah kategori

class KategoriPage extends StatelessWidget {
  const KategoriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // 🔙 Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        "Kategori Produk",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40)
                ],
              ),

              const SizedBox(height: 40),

              // 📦 Empty State
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.layers_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Kategori Produk Kosong",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

              // ➕ Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const TambahKategoriPage(),
                      ),
                    );
                  },
                  child: const Text("Tambah Kategori Produk"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}