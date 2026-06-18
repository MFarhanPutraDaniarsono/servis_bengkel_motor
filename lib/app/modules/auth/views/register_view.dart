import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capstone/app/routes/app_routes.dart';
import 'package:capstone/app/data/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthService authService = AuthService();

  // =========================
  // CONTROLLER DATA BENGKEL
  // =========================
  final TextEditingController workshopNameController =
      TextEditingController();

  final TextEditingController workshopPhoneController =
      TextEditingController();

  final TextEditingController cityController =
      TextEditingController();

  final TextEditingController addressController =
      TextEditingController();

  // =========================
  // CONTROLLER DATA PEMILIK
  // =========================
  final TextEditingController ownerNameController =
      TextEditingController();

  final TextEditingController ownerPhoneController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  final TextEditingController confirmController =
      TextEditingController();

  @override
  void dispose() {
    workshopNameController.dispose();
    workshopPhoneController.dispose();
    cityController.dispose();
    addressController.dispose();

    ownerNameController.dispose();
    ownerPhoneController.dispose();
    passwordController.dispose();
    confirmController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFEFEF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
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
                      onPressed: () => Get.back(),
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

                buildLabel("Nama Bengkel"),
                buildField(
                  controller:
                      workshopNameController,
                ),

                buildLabel(
                  "No. Handphone Bengkel",
                ),
                buildField(
                  controller:
                      workshopPhoneController,
                ),

                buildLabel(
                  "Kota / Kabupaten Bengkel",
                ),
                buildField(
                  controller: cityController,
                  hint:
                      "Pilih Kota / Kabupaten Bengkel",
                ),

                buildLabel("Alamat Bengkel"),
                buildField(
                  controller:
                      addressController,
                ),

                const SizedBox(height: 15),

                const Text("Data Pemilik"),

                buildLabel("Nama"),
                buildField(
                  controller:
                      ownerNameController,
                ),

                buildLabel("No. Handphone"),
                buildField(
                  controller:
                      ownerPhoneController,
                ),

                buildLabel("Password"),
                buildField(
                  controller:
                      passwordController,
                  obscure: true,
                ),

                buildLabel(
                  "Konfirmasi Password",
                ),
                buildField(
                  controller:
                      confirmController,
                  obscure: true,
                ),

                const SizedBox(height: 20),

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
                    onPressed: () async {
                      // VALIDASI
                      if (workshopNameController
                              .text
                              .isEmpty ||
                          workshopPhoneController
                              .text
                              .isEmpty ||
                          ownerNameController
                              .text
                              .isEmpty ||
                          ownerPhoneController
                              .text
                              .isEmpty ||
                          passwordController
                              .text
                              .isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Data tidak lengkap',
                        );
                        return;
                      }

                      if (passwordController.text !=
                          confirmController.text) {
                        Get.snackbar(
                          'Error',
                          'Konfirmasi password tidak cocok',
                        );
                        return;
                      }

                      try {
                        final response =
                            await authService
                                .register(
                          ownerName:
                              ownerNameController
                                  .text
                                  .trim(),
                          ownerPhone:
                              ownerPhoneController
                                  .text
                                  .trim(),
                          workshopName:
                              workshopNameController
                                  .text
                                  .trim(),
                          workshopPhone:
                              workshopPhoneController
                                  .text
                                  .trim(),
                          password:
                              passwordController
                                  .text
                                  .trim(),
                        );

                        if (response['message'] ==
                            'Register berhasil') {
                          Get.snackbar(
                            'Sukses',
                            'Registrasi berhasil',
                          );

                          Get.offAllNamed(
                            AppRoutes.otp,
                            arguments:response['phone']
                          );
                        } else {
                          Get.snackbar(
                            'Gagal',
                            response['message']
                                .toString(),
                          );
                        }
                      } catch (e) {
                        Get.snackbar(
                          'Error',
                          e.toString(),
                        );
                      }
                    },
                    child: const Text(
                      "Masuk",
                    ),
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

  static Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
      ),
      child: Text(text),
    );
  }

  static Widget buildField({
    TextEditingController? controller,
    String? hint,
    bool obscure = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 5,
      ),
      child: TextField(
        controller: controller,
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