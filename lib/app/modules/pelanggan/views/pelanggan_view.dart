import 'package:flutter/material.dart';
import 'package:capstone/app/modules/pelanggan/views/tambah_pelanggan_view.dart';

class PelangganPage extends StatelessWidget {
  const PelangganPage({super.key});

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
                        "Pelanggan",
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

              // 🔍 Search
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari nama pelanggan / No. Polisi kendaraan",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 👤 Empty State
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person_outline,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Pelanggan Kosong",
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
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const TambahPelangganPage(),
                      ),
                    );
                  },
                  child: const Text("Tambah Pelanggan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}