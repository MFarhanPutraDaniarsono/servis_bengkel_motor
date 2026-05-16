import 'package:flutter/material.dart';

class TambahPelangganPage extends StatefulWidget {
  const TambahPelangganPage({super.key});

  @override
  State<TambahPelangganPage> createState() =>
      _TambahPelangganPageState();
}

class _TambahPelangganPageState extends State<TambahPelangganPage> {
  // 🔥 List kendaraan dinamis
  List<Map<String, TextEditingController>> kendaraanList = [];

  @override
  void initState() {
    super.initState();
    tambahKendaraan(); // default 1 form
  }

  void tambahKendaraan() {
    setState(() {
      kendaraanList.add({
        "merk": TextEditingController(),
        "tipe": TextEditingController(),
        "nopol": TextEditingController(),
        "tahun": TextEditingController(),
      });
    });
  }

  void hapusKendaraan(int index) {
    setState(() {
      kendaraanList.removeAt(index);
    });
  }

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
                        "Tambah Pelanggan",
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

              Expanded(
                child: ListView(
                  children: [
                    // DATA PELANGGAN
                    const Text("Data Pelanggan",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),

                    const Text("Nama"),
                    const SizedBox(height: 5),
                    buildField(),

                    const SizedBox(height: 10),

                    const Text("No. Handphone"),
                    const SizedBox(height: 5),
                    buildField(hint: "Cth: 628987654321"),

                    const SizedBox(height: 20),

                    // DATA KENDARAAN
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Data Kendaraan",
                            style: TextStyle(
                                fontWeight: FontWeight.bold)),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[700],
                            minimumSize: const Size(80, 35),
                          ),
                          onPressed: tambahKendaraan,
                          child: const Text("Tambah"),
                        )
                      ],
                    ),

                    const SizedBox(height: 10),

                    // 🔥 LIST DINAMIS
                    ...List.generate(kendaraanList.length, (index) {
                      final item = kendaraanList[index];

                      return Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text("Merk"),
                                    const SizedBox(height: 5),
                                    buildField(
                                        controller: item["merk"],
                                        hint: "Yamaha/Honda"),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text("Tipe"),
                                    const SizedBox(height: 5),
                                    buildField(
                                        controller: item["tipe"],
                                        hint: "Jupiter/Vario"),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text("No. Polisi"),
                                    const SizedBox(height: 5),
                                    buildField(
                                        controller: item["nopol"],
                                        hint: "W 412 SYA"),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const Text("Tahun"),
                                    const SizedBox(height: 5),
                                    buildField(
                                        controller: item["tahun"],
                                        hint: "2024"),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),

                              // 🗑 DELETE
                              IconButton(
                                onPressed: () =>
                                    hapusKendaraan(index),
                                icon: const Icon(Icons.delete,
                                    color: Colors.red),
                              )
                            ],
                          ),

                          const SizedBox(height: 20),
                        ],
                      );
                    }),
                  ],
                ),
              ),

              // BUTTON SIMPAN
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

  // 🔧 reusable field
  Widget buildField({TextEditingController? controller, String? hint}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}