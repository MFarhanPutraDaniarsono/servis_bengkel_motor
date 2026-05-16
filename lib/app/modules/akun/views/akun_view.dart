import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/akun_controller.dart';
import 'package:capstone/app/modules/auth/views/login_view.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {

    // ambil controller dari binding
    final controller = Get.find<AkunController>();

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Title
              const Center(
                child: Text(
                  "Akun",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Card User
              containerCard(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, color: Colors.blue),
                    ),
                    const SizedBox(width: 15),

                    /// 🔥 DATA DARI CONTROLLER
                    Expanded(
                      child: Obx(
                        () => Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller.nama.value,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            Text(controller.noHp.value),
                            Text(
                              controller.role.value,
                              style: const TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const Icon(Icons.edit, color: Colors.green)
                  ],
                ),
              ),

              // 🔹 Card Toko (tidak diubah)
              containerCard(
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.store, color: Colors.blue),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bandung Jaya",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Jalan Abdul syukur, Kota Administrasi Jakarta Barat",
                            style: TextStyle(fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text("6281943661097"),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Chip(
                                label: Text("Pro"),
                                backgroundColor: Colors.green,
                                labelStyle:
                                    TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Text("Tgl Berakhir: 14 Mei 2026"),
                            ],
                          )
                        ],
                      ),
                    ),
                    const Icon(Icons.edit, color: Colors.green)
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // 🔹 Menu
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Menu",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

              menuItem(
                context,
                Icons.star,
                "Beri Penilaian dan Ulasan",
              ),

              menuItem(
                context,
                Icons.logout,
                "Keluar",
                isLogout: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔧 CARD
  Widget containerCard({required Widget child}) {
    return Container(
      margin:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  // 🔧 MENU ITEM
  Widget menuItem(
    BuildContext context,
    IconData icon,
    String title, {
    bool isLogout = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (isLogout) {
          Get.offAll(() => const LoginPage());
        }
      },
      child: Container(
        margin:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color:
                  isLogout ? Colors.orange : Colors.black54,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color:
                      isLogout ? Colors.orange : Colors.black,
                ),
              ),
            ),
            const Icon(Icons.chevron_right)
          ],
        ),
      ),
    );
  }
}