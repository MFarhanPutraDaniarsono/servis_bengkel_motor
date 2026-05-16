import 'package:flutter/material.dart';
import 'package:capstone/app/modules/produk/views/tambah_produk_view.dart';

class ProdukPage extends StatelessWidget {
  const ProdukPage({super.key});

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
                        "Produk",
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

              const SizedBox(height: 20),

              // 🔍 Search + Icon
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            "Cari nama, kode atau catatan produk",
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        suffixIcon: const Icon(Icons.qr_code),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.tune),
                  )
                ],
              ),

              const SizedBox(height: 15),

              // 🔽 Dropdown Kategori
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text("Semua Kategori Produk"),
                    ),
                    Icon(Icons.keyboard_arrow_down),
                    SizedBox(width: 10),
                    Icon(Icons.close),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // 📦 Empty State
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.inventory_2_outlined,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Produk Kosong",
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
                        builder: (context) => TambahProdukPage(),
                      ),
                    );
                  },
                  child: const Text("Tambah"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}