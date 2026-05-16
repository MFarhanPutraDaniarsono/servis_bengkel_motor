import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahProdukPage extends StatefulWidget {
  const TambahProdukPage({super.key});

  @override
  State<TambahProdukPage> createState() =>
      _TambahProdukPageState();
}

class _TambahProdukPageState
    extends State<TambahProdukPage> {
  bool isActive = true;

  final TextEditingController
      namaController =
      TextEditingController();

  final TextEditingController
      hargaBeliController =
      TextEditingController();

  final TextEditingController
      hargaJualController =
      TextEditingController();

  final TextEditingController
      hargaBengkelController =
      TextEditingController();

  final TextEditingController
      hargaPromoController =
      TextEditingController();

  final TextEditingController
      stokController =
      TextEditingController();

  final TextEditingController
      minStokController =
      TextEditingController();

  final TextEditingController
      catatanController =
      TextEditingController();

  final TextEditingController
      lokasiController =
      TextEditingController();

  String? selectedKategori;

  File? _image;
  final ImagePicker _picker =
      ImagePicker();

  Future<void> pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(
      source:
          ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(
          pickedFile.path,
        );
      });
    }
  }

  @override
  Widget build(
      BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Produk",
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(
          16,
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment
                  .start,
          children: [
            // Upload Image
            Center(
              child:
                  GestureDetector(
                onTap: pickImage,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration:
                      BoxDecoration(
                    border:
                        Border.all(
                      color: Colors
                          .grey,
                    ),
                    borderRadius:
                        BorderRadius
                            .circular(
                                12),
                  ),
                  child: _image ==
                          null
                      ? const Icon(
                          Icons.image,
                          size: 40,
                          color: Colors
                              .grey,
                        )
                      : ClipRRect(
                          borderRadius:
                              BorderRadius.circular(
                                  12),
                          child: kIsWeb
                              ? Image.network(
                                  _image!
                                      .path,
                                  fit: BoxFit
                                      .cover,
                                )
                              : Image.file(
                                  _image!,
                                  fit: BoxFit
                                      .cover,
                                ),
                        ),
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            // Nama Produk
            const Text(
              "Nama Produk",
            ),

            TextField(
              controller:
                  namaController,
              decoration:
                  const InputDecoration(
                hintText:
                    "Masukkan nama produk",
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            // Kategori
            const Text(
              "Kategori Produk",
            ),

            DropdownButtonFormField<
                String>(
              initialValue:
                  selectedKategori,
              items: [
                "Oli",
                "Sparepart",
                "Aksesoris"
              ]
                  .map(
                    (e) =>
                        DropdownMenuItem(
                      value: e,
                      child:
                          Text(e),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedKategori =
                      val;
                });
              },
              decoration:
                  const InputDecoration(
                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            // Harga
            buildInput(
              "Harga Beli (Opsional)",
              hargaBeliController,
              hint: "Rp 0",
            ),

            buildInput(
              "Harga Jual Pelanggan",
              hargaJualController,
              hint: "Rp 0",
            ),

            buildInput(
              "Harga Jual Bengkel (Opsional)",
              hargaBengkelController,
              hint: "Rp 0",
            ),

            buildInput(
              "Harga Promo (Opsional)",
              hargaPromoController,
              hint: "Rp 0",
            ),

            // Stok
            Row(
              children: [
                Expanded(
                  child:
                      buildInput(
                    "Stok Awal",
                    stokController,
                    hint: "0",
                  ),
                ),

                const SizedBox(
                  width: 10,
                ),

                Expanded(
                  child:
                      buildInput(
                    "Minimum Stok",
                    minStokController,
                    hint: "0",
                  ),
                ),
              ],
            ),

            // Switch
            Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                const Text(
                  "Produk Aktif",
                ),
                Switch(
                  value:
                      isActive,
                  onChanged:
                      (val) {
                    setState(() {
                      isActive =
                          val;
                    });
                  },
                ),
              ],
            ),

            // Catatan
            buildInput(
              "Catatan (Opsional)",
              catatanController,
              hint:
                  "Contoh: Bisa untuk beat, vario",
              maxLines: 3,
            ),

            // Lokasi
            buildInput(
              "Lokasi Rak (Opsional)",
              lokasiController,
              hint:
                  "Contoh: A-01",
            ),

            const SizedBox(
              height: 20,
            ),

            // Button
            SizedBox(
              width:
                  double.infinity,
              child:
                  ElevatedButton(
                onPressed: () {
                  // simpan data
                },
                style:
                    ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(
                    vertical:
                        16,
                  ),
                ),
                child:
                    const Text(
                  "Simpan",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInput(
    String label,
    TextEditingController
        controller, {
    int maxLines = 1,
    String hint = "",
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(
        bottom: 12,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment
                .start,
        children: [
          Text(label),

          const SizedBox(
            height: 4,
          ),

          TextField(
            controller:
                controller,
            maxLines:
                maxLines,
            decoration:
                InputDecoration(
              hintText:
                  hint,
              border:
                  const OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}