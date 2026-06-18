import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:capstone/app/routes/app_routes.dart';
import 'package:capstone/app/data/services/auth_service.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController otpController =
      TextEditingController();

  final AuthService authService = AuthService();

  late final String phone;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    phone = Get.arguments ?? '';
  }

  @override
  void dispose() {
    otpController.dispose();
    super.dispose();
  }

  Future<void> verifyOtp() async {
    if (otpController.text.trim().isEmpty) {
      Get.snackbar(
        'Error',
        'Masukkan kode OTP',
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final response = await authService.verifyOtp(
        phone,
        otpController.text.trim(),
      );

      if (response['message'] == 'OTP valid') {
        Get.snackbar(
          'Sukses',
          'Verifikasi berhasil',
        );

        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar(
          'Gagal',
          response['message'].toString(),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verifikasi OTP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.lock_outline,
              size: 80,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            const Text(
              'Masukkan kode OTP yang dikirim ke WhatsApp',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 10),

            Text(
              phone,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Masukkan 6 digit OTP',
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed:
                    isLoading ? null : verifyOtp,
                child: isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text(
                        'Verifikasi',
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}