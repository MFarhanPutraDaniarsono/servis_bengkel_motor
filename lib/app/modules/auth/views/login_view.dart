import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:capstone/app/modules/auth/views/register_view.dart';
import 'package:capstone/app/routes/app_routes.dart';
import 'package:capstone/app/data/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService authService = AuthService();

  bool isLoading = false;

  Future<void> login() async {
    try {
      setState(() {
        isLoading = true;
      });

      final response = await authService.login(
        phoneController.text.trim(),
        passwordController.text.trim(),
      );

      if (response['token'] != null) {
        await GetStorage().write(
          'token',
          response['token'],
        );

        Get.snackbar(
          'Berhasil',
          'Login berhasil',
          snackPosition: SnackPosition.BOTTOM,
        );

        Get.offAllNamed(
          AppRoutes.dashboard,
        );
      } else {
        Get.snackbar(
          'Gagal',
          response['message'] ?? 'Login gagal',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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
                          const Align(
                            alignment:
                                Alignment.centerLeft,
                            child:
                                Text("No. Handphone"),
                          ),

                          const SizedBox(height: 5),

                          TextField(
                            controller:
                                phoneController,
                            keyboardType:
                                TextInputType.phone,
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

                          const Align(
                            alignment:
                                Alignment.centerLeft,
                            child: Text("Password"),
                          ),

                          const SizedBox(height: 5),

                          TextField(
                            controller:
                                passwordController,
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
                              onPressed:
                                  isLoading
                                      ? null
                                      : login,
                              child:
                                  isLoading
                                      ? const CircularProgressIndicator(
                                        color:
                                            Colors
                                                .white,
                                      )
                                      : const Text(
                                        "Masuk",
                                      ),
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