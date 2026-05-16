import 'package:flutter/material.dart';

class JasaPage extends StatelessWidget {
  const JasaPage({super.key});

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
                        "Jasa",
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
                  hintText: "Cari nama jasa",
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

              // 🔧 Empty State
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.build,
                      size: 80,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Jasa Kosong",
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
                        builder: (context) => const TambahJasaPage(),
                      ),
                    );
                  },
                  child: const Text("Tambah Jasa"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////
// 🔥 HALAMAN TAMBAH JASA (SUDAH INCLUDE DI FILE INI)
//////////////////////////////////////////////////////////////

class TambahJasaPage extends StatelessWidget {
  const TambahJasaPage({super.key});

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
                        "Tambah Jasa",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),

              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  children: [
                    const Center(
                      child: Text(
                        "Tambah Jasa",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    buildLabel("Nama"),
                    buildField(),

                    buildLabel("Harga"),
                    buildField(isCurrency: true),

                    buildLabel("Komisi Mekanik"),
                    buildField(isCurrency: true),

                    const SizedBox(height: 5),
                    const Text(
                      "Jika diisi maka perhitungan persentase komisi dari mekanik diabaikan",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),

              // 🔘 Button Simpan
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
                  onPressed: () {},
                  child: const Text("Simpan"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔧 LABEL
  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(text),
    );
  }

  // 🔧 FIELD
  Widget buildField({bool isCurrency = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: TextField(
        keyboardType:
            isCurrency ? TextInputType.number : TextInputType.text,
        decoration: InputDecoration(
          prefixText: isCurrency ? "Rp " : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}