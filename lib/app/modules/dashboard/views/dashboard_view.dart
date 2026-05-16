import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capstone/app/routes/app_routes.dart';

import '../controllers/dashboard_controller.dart';
import '../../akun/controllers/akun_controller.dart';
import '../../akun/views/akun_view.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔥 GETX CONTROLLER
    final controller =
        Get.find<DashboardController>();

    return Scaffold(
      backgroundColor:
          Colors.transparent,

      body: Stack(
        children: [
          // 🔵 BACKGROUND IMAGE
          Container(
            decoration:
                const BoxDecoration(
              image:
                  DecorationImage(
                image: AssetImage(
                  "assets/bg.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔵 OVERLAY
          const ColoredBox(
            color: Color.fromRGBO(
              255,
              255,
              255,
              0.9,
            ),
          ),

          // 🔵 CONTENT (GETX REACTIVE)
          Obx(
            () => IndexedStack(
              index: controller
                  .selectedIndex
                  .value,
              children: [
                const _DashboardContent(),

                // 🔥 Transaksi
                controller.pages[1],

                // 🔥 Servis
                controller.pages[2],

                // 🔥 Fix AkunController
                Builder(
                  builder: (_) {
                    if (!Get
                        .isRegistered<
                            AkunController>()) {
                      Get.put(
                        AkunController(),
                      );
                    }

                    return const AkunPage();
                  },
                ),
              ],
            ),
          ),
        ],
      ),

      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          type:
              BottomNavigationBarType
                  .fixed,
          currentIndex: controller
              .selectedIndex.value,
          selectedItemColor:
              Colors.blue,
          unselectedItemColor:
              Colors.grey,

          // 🔥 GETX
          onTap:
              controller.changeIndex,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.grid_view,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.receipt_long,
              ),
              label: "Transaksi",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.build,
              ),
              label: "Servis",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: "Akun",
            ),
          ],
        ),
      ),
    );
  }
}

class _DashboardContent
    extends StatelessWidget {
  const _DashboardContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // 🔵 HEADER
          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.all(
              20,
            ),
            decoration:
                const BoxDecoration(
              color: Colors.blue,
              borderRadius:
                  BorderRadius.only(
                bottomLeft:
                    Radius.circular(
                  20,
                ),
                bottomRight:
                    Radius.circular(
                  20,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Text(
                      "Dashboard",
                      style:
                          TextStyle(
                        fontSize: 22,
                        color: Colors
                            .white,
                        fontWeight:
                            FontWeight
                                .bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Bandung Jaya",
                      style:
                          TextStyle(
                        color: Colors
                            .white70,
                      ),
                    ),
                  ],
                ),
                const CircleAvatar(
                  backgroundColor:
                      Colors.white,
                  child: Icon(
                    Icons.person,
                    color:
                        Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(
            height: 20,
          ),

          // 🔵 CONTENT
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: ListView(
                children: [
                  Container(
                    padding:
                        const EdgeInsets
                            .all(
                      15,
                    ),
                    decoration:
                        BoxDecoration(
                      color: Colors
                          .white,
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                      boxShadow:
                          const [
                        BoxShadow(
                          color: Colors
                              .black12,
                          blurRadius:
                              5,
                          offset:
                              Offset(
                            0,
                            3,
                          ),
                        ),
                      ],
                    ),
                    child:
                        const Column(
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .start,
                      children: [
                        Text(
                          "Pendapatan Hari Ini",
                          style:
                              TextStyle(
                            fontSize:
                                12,
                            color: Colors
                                .grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Rp666.000",
                          style:
                              TextStyle(
                            fontSize:
                                20,
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Pendapatan Bulan Ini: Rp1.200.000",
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  const Text(
                    "Menu",
                    style: TextStyle(
                      fontWeight:
                          FontWeight
                              .bold,
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    children: [
                      MenuItem(
                        icon:
                            Icons.build,
                        label:
                            "Jasa",
                        onTap: () {
                          Get.toNamed(
                            AppRoutes
                                .jasa,
                          );
                        },
                      ),
                      MenuItem(
                        icon:
                            Icons.people,
                        label:
                            "Pelanggan",
                        onTap: () {
                          Get.toNamed(
                            AppRoutes
                                .pelanggan,
                          );
                        },
                      ),
                      MenuItem(
                        icon: Icons
                            .category,
                        label:
                            "Kategori",
                        onTap: () {
                          Get.toNamed(
                            AppRoutes
                                .kategori,
                          );
                        },
                      ),
                      MenuItem(
                        icon: Icons
                            .inventory,
                        label:
                            "Produk",
                        onTap: () {
                          Get.toNamed(
                            AppRoutes
                                .produk,
                          );
                        },
                      ),
                      MenuItem(
                        icon: Icons
                            .attach_money,
                        label:
                            "Buku Kas",
                        onTap: () {
                          Get.toNamed(
                            AppRoutes
                                .bukukas,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItem
    extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Container(
              padding:
                  const EdgeInsets
                      .all(15),
              decoration:
                  BoxDecoration(
                color:
                    Colors.white,
                borderRadius:
                    BorderRadius.circular(
                  10,
                ),
                boxShadow:
                    const [
                  BoxShadow(
                    color: Colors
                        .black12,
                    blurRadius:
                        3,
                    offset:
                        Offset(
                      0,
                      2,
                    ),
                  ),
                ],
              ),
              child: Icon(
                icon,
                color:
                    Colors.blue,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              textAlign:
                  TextAlign.center,
              style:
                  const TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}