import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'scanner_view.dart';

class ServisPage extends StatefulWidget {
  const ServisPage({super.key});

  @override
  State<ServisPage> createState() => _ServisPageState();
}

class _ServisPageState extends State<ServisPage> {
  String barcode = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              const Center(
                child: Text(
                  "Tambah Transaksi",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔥 Pilih Produk + Scan Barcode
              Row(
                children: [
                  Expanded(
                    child: dropdownBox("Pilih Produk"),
                  ),
                  const SizedBox(width: 10),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.qr_code_scanner),
                      onPressed: () async {
                        final result =
                            await Get.to(() => const ScannerView());

                        if (result != null) {
                          setState(() {
                            barcode = result;
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              const Text("Detail Produk"),
              const SizedBox(height: 10),

              // 🔥 HASIL SCAN DITAMPILKAN DI SINI
              Center(
                child: Text(
                  barcode.isEmpty
                      ? "Belum ada produk yang dipilih"
                      : "Barcode: $barcode",
                  style: const TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 20),

              const Text("Detail Jasa"),
              const SizedBox(height: 10),

              const Center(
                child: Text(
                  "Belum ada jasa yang dipilih",
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              const SizedBox(height: 15),

              // Button Tambah Jasa
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showTambahJasaModal(context);
                  },
                  child: const Text("Tambah Jasa"),
                ),
              ),

              const SizedBox(height: 20),

              // Pelanggan
              const Text("Pelanggan (Opsional)"),
              const SizedBox(height: 5),

              Row(
                children: [
                  Expanded(
                    child: dropdownBox("Pilih Pelanggan"),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.close),
                  ),
                ],
              ),

              const SizedBox(height: 15),

              // Merk & Tipe
              Row(
                children: [
                  Expanded(
                    child: inputBox("Merk (Opsional)", "Cth: Honda"),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: inputBox("Tipe (Opsional)", "Cth: Vario"),
                  ),
                ],
              ),

              // No Polisi & Tahun
              Row(
                children: [
                  Expanded(
                    child: inputBox("No. Polisi (Opsional)", ""),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: inputBox("Tahun (Opsional)", ""),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // Keluhan
              inputBox(
                "Keluhan/Kendala (Opsional)",
                "",
                maxLines: 3,
              ),

              const SizedBox(height: 20),

              // Subtotal + Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Subtotal"),
                      Text(
                        "Rp0",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text("Selanjutnya"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // COMPONENT
  Widget dropdownBox(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: const TextStyle(color: Colors.grey),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget inputBox(String label, String hint, {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          const SizedBox(height: 5),
          TextField(
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// MODAL TAMBAH JASA
void showTambahJasaModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Pilih Jasa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: "Cari Nama Jasa",
                filled: true,
                fillColor: const Color(0xFFF2F2F2),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text("Tambah Jasa"),
              ),
            ),
          ],
        ),
      );
    },
  );
}