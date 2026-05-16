import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capstone/app/modules/auth/views/register_view.dart';
import 'package:capstone/app/routes/app_routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔵 BACKGROUND IMAGE
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // 🔵 OVERLAY
          Container(
            color: const Color.fromRGBO(
              0,
              0,
              0,
              0.3,
            ),
          ),

          // 🔵 CONTENT
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    const SizedBox(height: 30),

                    // 🔵 LOGO
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 3,
                        ),
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/logo.png',
                          height: 70,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔵 TITLE
                    const Text(
                      "BMA",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 5),

                    const Text(
                      "Masuk",
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // 🔵 FORM CARD
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          // No HP
                          const Align(
                            alignment:
                                Alignment.centerLeft,
                            child:
                                Text("No. Handphone"),
                          ),

                          const SizedBox(height: 5),

                          TextField(
                            decoration:
                                InputDecoration(
                              filled: true,
                              fillColor:
                                  Colors.grey[200],
                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  6,
                                ),
                                borderSide:
                                    BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          // Password
                          const Align(
                            alignment:
                                Alignment.centerLeft,
                            child: Text("Password"),
                          ),

                          const SizedBox(height: 5),

                          TextField(
                            obscureText: true,
                            decoration:
                                InputDecoration(
                              filled: true,
                              fillColor:
                                  Colors.grey[200],
                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  6,
                                ),
                                borderSide:
                                    BorderSide.none,
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Align(
                            alignment:
                                Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(
                                "Lupa Password ?",
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

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
                                  AppRoutes
                                      .dashboard,
                                );
                              },
                              child:
                                  const Text("Masuk"),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // 🔵 REGISTER
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Belum Punya Akun ? ",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(
                              () =>
                                  const RegisterPage(),
                            );
                          },
                          child: const Text(
                            "Daftar",
                            style: TextStyle(
                              color: Colors.yellow,
                              fontWeight:
                                  FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}