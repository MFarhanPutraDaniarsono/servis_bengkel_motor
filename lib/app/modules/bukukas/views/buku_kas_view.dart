import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BukuKasPage extends StatefulWidget {
  const BukuKasPage({super.key});

  @override
  State<BukuKasPage> createState() => _BukuKasPageState();
}

class _BukuKasPageState extends State<BukuKasPage> {
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();

  String formatDate(DateTime date) {
    return DateFormat('dd MMM yyyy').format(date);
  }

  Future<void> pickDate({required bool isStart}) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isStart ? startDate : endDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
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
                        "Buku Kas",
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

              // 📅 TANGGAL (SUDAH BISA DIKLIK)
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => pickDate(isStart: true),
                      child: dateBox("Tanggal Awal", formatDate(startDate)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => pickDate(isStart: false),
                      child: dateBox("Tanggal Akhir", formatDate(endDate)),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 📭 Empty State
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.menu_book, size: 80, color: Colors.grey),
                      SizedBox(height: 10),
                      Text(
                        "Buku Kas Kosong",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),

              // ➕ Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Tambah Buku Kas"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget dateBox(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(value),
              const Icon(Icons.calendar_today, size: 18),
            ],
          ),
        ),
      ],
    );
  }
}