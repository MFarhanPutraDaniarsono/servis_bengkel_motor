import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capstone/app/routes/app_routes.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xFFEFEFEF),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                // Header
                Row(
                  children: [
                    IconButton(
                      onPressed: () =>
                          Get.back(),
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: Text(
                          "Daftar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                  ],
                ),

                const SizedBox(height: 10),

                const Text(
                  "Data Bengkel",
                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                buildLabel(
                  "Nama Bengkel",
                ),
                buildField(),

                buildLabel(
                  "No. Handphone Bengkel",
                ),
                buildField(),

                buildLabel(
                  "Kota / Kabupaten Bengkel",
                ),
                buildField(
                  hint:
                      "Pilih Kota / Kabupaten Bengkel",
                ),

                buildLabel(
                  "Alamat Bengkel",
                ),
                buildField(),

                const SizedBox(height: 15),

                const Text(
                  "Jenis Bengkel",
                ),

                const SizedBox(height: 5),

                const Row(
                  children: [
                    Icon(
                      Icons
                          .radio_button_unchecked,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Mobil / Motor",
                    ),
                  ],
                ),

                const Row(
                  children: [
                    Icon(
                      Icons
                          .radio_button_unchecked,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Lainnya, Misal : Las, Bubut",
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                const Text(
                  "Data Pemilik",
                ),

                buildLabel("Nama"),
                buildField(),

                buildLabel(
                  "No. Handphone",
                ),
                buildField(),

                buildLabel("Password"),
                buildField(
                  obscure: true,
                ),

                buildLabel(
                  "Konfirmasi Password",
                ),
                buildField(
                  obscure: true,
                ),

                const SizedBox(height: 20),

                // 🔥 BUTTON REGISTER
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style:
                        ElevatedButton
                            .styleFrom(
                      backgroundColor:
                          Colors.blue[800],
                    ),
                    onPressed: () {
                      // 🔥 GETX ROUTE
                      Get.offAllNamed(
                        AppRoutes.dashboard,
                      );
                    },
                    child:
                        const Text("Masuk"),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // 🔧 Helper
  static Widget buildLabel(
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(text),
    );
  }

  static Widget buildField({
    String? hint,
    bool obscure = false,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 5),
      child: TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Colors.grey[300],
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(4),
            borderSide:
                BorderSide.none,
          ),
        ),
      ),
    );
  }
}